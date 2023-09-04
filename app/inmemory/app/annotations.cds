using { guitarstoreSrv } from '../srv/service.cds';

annotate guitarstoreSrv.Product with @odata.draft.enabled;
annotate guitarstoreSrv.Manufacturer with @odata.draft.enabled;
annotate guitarstoreSrv.Manufacturer with @cds.odata.valuelist;
annotate guitarstoreSrv.Product with @cds.odata.valuelist;
annotate guitarstoreSrv.Product with @UI.HeaderInfo: { TypeName: 'Product', TypeNamePlural: 'Products', Title: { Value: name } };
annotate guitarstoreSrv.Product with {
  ID @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarstoreSrv.Product with @UI.Identification: [{ Value: name }];
annotate guitarstoreSrv.Product with {
  name @title: 'Product Name';
  description @title: 'Product Description';
  price @title: 'Product Price'
};

annotate guitarstoreSrv.Product with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Manufacturer', Value: manufacturer_ID }
];

annotate guitarstoreSrv.Product with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Manufacturer', Value: manufacturer_ID }
  ]
};

annotate guitarstoreSrv.Product with {
  manufacturer @Common.Text: { $value: manufacturer.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate guitarstoreSrv.Product with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'Feature', Target : 'features/@UI.LineItem' }
];

annotate guitarstoreSrv.Manufacturer with @UI.HeaderInfo: { TypeName: 'Manufacturer', TypeNamePlural: 'Manufacturers', Title: { Value: name } };
annotate guitarstoreSrv.Manufacturer with {
  ID @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarstoreSrv.Manufacturer with @UI.Identification: [{ Value: name }];
annotate guitarstoreSrv.Manufacturer with {
  name @title: 'Manufacturer Name';
  location @title: 'Manufacturer Location'
};

annotate guitarstoreSrv.Manufacturer with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: location }
];

annotate guitarstoreSrv.Manufacturer with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: location }
  ]
};

annotate guitarstoreSrv.Manufacturer with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate guitarstoreSrv.Feature with @UI.HeaderInfo: { TypeName: 'Feature', TypeNamePlural: 'Features' };
annotate guitarstoreSrv.Feature with {
  description @title: 'Feature Description'
};

annotate guitarstoreSrv.Feature with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: description }
];

annotate guitarstoreSrv.Feature with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate guitarstoreSrv.Feature with {
  product @Common.Text: { $value: product.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate guitarstoreSrv.Feature with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

