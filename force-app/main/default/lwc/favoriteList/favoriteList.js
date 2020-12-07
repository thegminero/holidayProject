import { LightningElement, api, wire, track } from 'lwc';
import { subscribe, unsubscribe, publish, MessageContext, APPLICATION_SCOPE } from 'lightning/messageService';
import FAVHOLMC from '@salesforce/messageChannel/userHolidays__c';
import Id from '@salesforce/user/Id';
import updateFavoriteList from '@salesforce/apex/CalendarController.updateFavoriteList';
import getFavoriteList from '@salesforce/apex/CalendarController.getFavoriteList';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'

const FAV_UPDATE_SUCCESS_TITLE = 'Favorite holiday list successfully updated'
const FAV_UPDATE_SUCCESS_VARIANT = 'success'
const FAV_UPDATE_ERROR_TITLE = 'Could not update favorite list'
const FAV_UPDATE_ERROR_VARIANT = 'error'

export default class FavoriteList extends LightningElement {
  userId = Id;
  subscription = null;
  userSavedHolidays;
  @track favoriteHolidays = [];
  @wire(MessageContext)
  messageContext;

  @api
  get showHolidays() {
    return (this.favoriteHolidays.length > 0);
  }

  connectedCallback() {
    // Subscribe to the message channel to retrieve the holiday.
    this.subscribeMC();
    //get existing holidays from user 
    this.getUserFavorites();
  }

  //subscribe to the messaging service
  subscribeMC() {
    let subscription = subscribe(this.messageContext,
      FAVHOLMC, (message) => { this.updateFavorites(message.detail); },
      { scope: APPLICATION_SCOPE });
  }

  disconnectedCallback() {
    // Unsubscribe from message
    unsubscribe(this.subscription);
    this.subscription = null;
  }

  // show toast message - user feedback 
  showToast(title, variant) {
    const event = new ShowToastEvent({
      title: title,
      variant: variant
    });
    this.dispatchEvent(event);
  }

  // update favorite list in the UI
  updateFavorites(message) {
    
    if (!message.favorite_holidays.favorite) {
      this.favoriteHolidays = this.favoriteHolidays.filter(holiday => {
        return holiday.name !== message.favorite_holidays.name;
      });
    }
    else {
      const holdiaykeys  = this.favoriteHolidays.map(holiday => holiday.name)
      if (!holdiaykeys.includes(message.favorite_holidays.name)){
        this.favoriteHolidays.unshift(message.favorite_holidays);
      }
      else{
        this.favoriteHolidays = this.favoriteHolidays.filter(holiday => {
          return holiday.name !== message.favorite_holidays.name;
        });
      }
    }
    const stringHolidays = JSON.stringify(this.favoriteHolidays);
    this.updateUserFavorites(stringHolidays);
  }
  
  // update favorite list User Object - Apex
  updateUserFavorites(favorites) {
    updateFavoriteList({ holidayList: favorites })
      .then(() => {
        this.showToast(FAV_UPDATE_SUCCESS_TITLE, FAV_UPDATE_SUCCESS_VARIANT)
      })
      .catch((error) => {
        this.showToast(FAV_UPDATE_ERROR_TITLE, FAV_UPDATE_ERROR_VARIANT)
      });
  }
  async getUserFavorites(){
    const userHoldiayString = await getFavoriteList();
    this.userSavedHolidays = JSON.parse(userHoldiayString);
    this.favoriteHolidays = this.userSavedHolidays;
    
  }
}