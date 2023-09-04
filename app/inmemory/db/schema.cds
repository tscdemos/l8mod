namespace guitarstore;

entity Product {
  key ID: UUID;
  name: String(200);
  description: String(500);
  price: Decimal(10,2);
  manufacturer: Association to Manufacturer;
  features: Composition of many Feature on features.product = $self;
}

entity Manufacturer {
  key ID: UUID;
  name: String(200);
  location: String(200);
  products: Association to many Product on products.manufacturer = $self;
}

entity Feature {
  key ID: UUID;
  description: String(200);
  product: Association to Product;
}

