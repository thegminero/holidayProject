import { LightningElement, api, wire } from 'lwc';

export default class HolidayTile extends LightningElement {
    liked = false;
    subscription = null;
    @api day;
    @api readonly;
    
    handleToggle() {
        try {
            this.liked = !this.liked;
            let selectedDay = { ...this.day };
            selectedDay['favorite'] = this.liked
            const selectedDateEvent = new CustomEvent('togglefavorite', { detail: selectedDay });
            this.dispatchEvent(selectedDateEvent);
        }
        catch (e) {
            console.log(e.message)
        }
    }
}