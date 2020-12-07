import { LightningElement, api } from 'lwc';

export default class FavoriteTile extends LightningElement {
    liked = true;
    @api day;
}