import { LightningElement, api, wire } from 'lwc';

export default class HolidayTile extends LightningElement {
    liked = false;
    subscription = null;
    @api day;
    @api readonly;
    
    connectedCallback(){
        console.log('is read only', this.readonly);
    }

    handleToggle() {
        console.log(this.readonly)
        if (!this.readonly) {
            this.liked = !this.liked;
            console.log('toogle')
            let selectedDay = {...this.day };
            selectedDay['favorite'] = this.liked
            const selectedDateEvent = new CustomEvent('togglefavorite', { detail: selectedDay });
            this.dispatchEvent(selectedDateEvent);
        }

    }
}