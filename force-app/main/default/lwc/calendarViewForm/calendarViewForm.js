import { LightningElement, wire, track, api } from 'lwc';
import getCalendarHolidays from '@salesforce/apex/CalendarController.getCalendarHolidays';

export default class CalendarViewForm extends LightningElement {
    day  = new Date().getDay();
    month = new Date().getMonth();
    year = new Date().getFullYear();
    error;
    @api holidays;
    @track selectedDate;
    
    @api
    get monthLabel() {
        const month = (this.selectedDate !== 'undefined') 
        ? 
        new Date(this.selectedDate).toLocaleString('default', { month: 'long' }) 
        : new Date().toLocaleString('default', { month: 'long' });

        return `${month} holidays`;
    }

    @api
    get yearLabel() {
        const year = (this.selectedDate !== 'undefined') 
        ? 
        new Date(this.selectedDate).getFullYear()
        : new Date().getFullYear();

        return `${year} Holidays`;
    }

    @api
    get todayHolidays() {
        const dailyHolidays = (this.holidays !== 'undefined' && this.holidays) ? 
        this.holidays.filter(holiday => 
            new Date(holiday.date.iso).toString() === new Date(this.selectedDate).toString()) : [];
        return dailyHolidays;
    }

    @api
    get monthHolidays() {
        const monthlyHolidays = (this.holidays !== 'undefined' && this.holidays) ? 
        this.holidays.filter(holiday => (holiday.date.datetime.month-1) === new Date(this.selectedDate).getMonth()) : [];
        return monthlyHolidays;
    }

    // Wire method to get holidays based on year selected
    @wire(getCalendarHolidays, { year: '$year' })
    wiredCalendarHolidays({ error, data }) {
        if (data) {
            this.holidays = [...data.response.holidays];
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }

    // Set date format - convert to ISO String, remove Time Stamp
    handleSelectedDate(event){
        const dateSelection = new Date(event.detail);
        this.year = dateSelection.getFullYear();
        this.selectedDate = dateSelection.toISOString().split('T')[0];
    }
}