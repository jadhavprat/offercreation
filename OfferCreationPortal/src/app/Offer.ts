    import { SubOffer } from "./SubOffer";

    export class Offer {
        public id: number= 0;
        public offerName: string='';
        public offerDescription: string='';
        public offerType: string='';
        public activationDate: string='';
        public expirationDate: string='';
        public subOffers: SubOffer[]=[];
    }