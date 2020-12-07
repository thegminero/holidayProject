import { LightningElement, api } from 'lwc';

export default class HolidayNotFound extends LightningElement {
    @api notFoundLabel;
    @api imageStyle;

    @api
    get displayLabel() {
        return this.notFoundLabel;
    }

    set displayLabel(value) {
       this.notFoundLabel = value.toUpperCase();
    }
}