namespace com.sales.order;

using {
    cuid,
    managed,
// Country,
// Currency
} from '@sap/cds/common';

entity Countries {
    key ID    : String(3);
        name  : localized String(255);
        descr : localized String(1000);
}

entity Currencies {
    key ID          : String(3);
        Description : localized String;
}

entity Header : managed {
    key ID           : UUID;
        OrderNumber  : String(8) @readonly;
        Email        : String(30);
        FirstName    : String(30);
        LastName     : String(30);
        Country      : Association to one Countries;
        DeliveryDate : Timestamp;
        OrderStatus  : Integer;
        ImageURL     : String;
        Items        : Composition of many Items
                           on Items.Header = $self; 
}

entity Items  {
    key ID               : UUID;
        OrderNumber      : String(8) @readonly;
        PositionNumber   : Integer   @readonly;
        Name             : String(40);
        Description      : String(40);
        ReleaseDate      : Timestamp;
        DiscontinuedDate : Timestamp;

        @Semantics.amount.currencyCode   : 'Currency'
        Price            : Decimal(12, 2);

        @Semantics.currencyCode
        Currency         : Association to one Currencies;

        @Semantics.quantity.unitOfMeasure: 'unitOfMeasure'
        Height           : Decimal(15, 3);

        @Semantics.quantity.unitOfMeasure: 'unitOfMeasure'
        Width            : Decimal(15, 3);

        @Semantics.quantity.unitOfMeasure: 'unitOfMeasure'
        Depth            : Decimal(15, 3);
        Quantity         : Decimal(16, 2);

        @Semantics.unitOfMeasure         : true
        unitOfMeasure    : String(4);
        Header           : Association to Header;
}
