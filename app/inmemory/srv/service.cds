using { guitarstore } from '../db/schema.cds';

service guitarstoreSrv {
  entity Product as projection on guitarstore.Product;
  entity Manufacturer as projection on guitarstore.Manufacturer;
}