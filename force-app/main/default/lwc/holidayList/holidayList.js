import { LightningElement, api, wire } from 'lwc';
import { subscribe, unsubscribe, publish, MessageContext, APPLICATION_SCOPE } from 'lightning/messageService';
import FAVHOLMC from '@salesforce/messageChannel/userHolidays__c';
import getFavoriteList from '@salesforce/apex/CalendarController.getFavoriteList';

export default class HolidayList extends LightningElement {
  liked = false;
  userSavedHolidays;
  @api notFoundLabel;
  @api holidays = [];
  // wired message context
  @wire(MessageContext) messageContext;

  @api
  get showHolidays() {
    return (this.holidays.length > 0);
  }

  connectedCallback() {
    console.log('getting user favorites')
    //get existing holidays from user 
    this.getUserFavorites();
  }

  // Toggle favorite holiday and 
  handleToggle() {
    this.liked = !this.liked;
  }

  // invoke send Message Service
  toggleFavorite(event) {
    this.sendMessageService(event.detail)
  }
  
  // Publishes the selected event on the FAVHOLMC.
  // Explicitly pass the holdiay to the parameter favorite_holidays
  sendMessageService(holiday) { 
    const message = {
      detail: { favorite_holidays: holiday }
      };
    publish(this.messageContext, FAVHOLMC, message)
  }
  
  // Get Users already saved holidays
  async getUserFavorites(){
    const userHoldiayString = await getFavoriteList();
    this.userSavedHolidays = JSON.parse(userHoldiayString);
    this.favoriteHolidays = [...this.userSavedHolidays];
    this.checkNsetFavorite();    
  }
  
  // Compare list of holidays with favorites to update stateful button icon
  checkNsetFavorite(){
    console.log('check n set favorites');
    const holdiaykeys  = this.favoriteHolidays.map(holiday => holiday.name)
    // shallow copy create proxy object array which are immutable, 
    // need to JSON parse / stringify
    let modifHolidays = JSON.parse(JSON.stringify(this.holidays));
    modifHolidays.forEach((day, index)=>{
      if(holdiaykeys.includes(day.name)){
        modifHolidays[index].favorite = true;
      }
      else{
        modifHolidays[index].favorite = false;
      }
    })
    this.holidays = [...modifHolidays];
    console.log(this.holidays);
  }

}