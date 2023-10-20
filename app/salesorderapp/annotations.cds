using SalesOrdersSrv as service from '../../srv/sales-order-srv';

annotate service.Header with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Ordernumber}',
            Value : OrderNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Firstname}',
            Value : FirstName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Lastname}',
            Value : LastName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>email}',
            Value : Email,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Countryid}',
            Value : Country_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : DeliveryDate,
            Label : '{i18n>Deliverydate}',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedAt,
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy,
        },
        {
            $Type : 'UI.DataField',
            Value : OrderStatus,
            Label : '{i18n>Orderstatus}',
        },
    ]
);
annotate service.Header with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Ordernumber}',
                Value : OrderNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : Email,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Firstname}',
                Value : FirstName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Lastname}',
                Value : LastName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Countryid}',
                Value : Country_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Deliverydate}',
                Value : DeliveryDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Orderstatus}',
                Value : OrderStatus,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Items}',
            ID : 'i18nItems',
            Target : 'Items/@UI.LineItem#i18nItems',
        },
    ]
);
annotate service.Header with @(
    UI.SelectionFields : [
        OrderNumber,
        Email,
    ]
);
annotate service.Header with {
    OrderNumber @Common.Label : '{i18n>Ordernumber}'
};
annotate service.Header with {
    Email @Common.Label : 'Email'
};
annotate service.Header with {
    Country @Common.Label : 'Country_ID'
};
annotate service.Items with @(
    UI.LineItem #i18nItems : [
        {
            $Type : 'UI.DataField',
            Value : OrderNumber,
            Label : '{i18n>Ordernumber}',
        },
        {
            $Type : 'UI.DataField',
            Value : PositionNumber,
            Label : '{i18n>Positionnumber}',
        },
        {
            $Type : 'UI.DataField',
            Value : Name,
            Label : '{i18n>Name}',
        },{
            $Type : 'UI.DataField',
            Value : Description,
            Label : '{i18n>Description}',
        },{
            $Type : 'UI.DataField',
            Value : Price,
            Label : '{i18n>Price}',
        },
        {
            $Type : 'UI.DataField',
            Value : Currency_ID,
            Label : '{i18n>Currencyid}',
        },{
            $Type : 'UI.DataField',
            Value : Quantity,
            Label : '{i18n>Quantity}',
        },{
            $Type : 'UI.DataField',
            Value : ReleaseDate,
            Label : '{i18n>Releasedate}',
        },
        {
            $Type : 'UI.DataField',
            Value : DiscontinuedDate,
            Label : '{i18n>Discontinueddate}',
        },
        {
            $Type : 'UI.DataField',
            Value : Height,
            Label : '{i18n>Height}',
        },{
            $Type : 'UI.DataField',
            Value : Width,
            Label : '{i18n>Width}',
        },
        {
            $Type : 'UI.DataField',
            Value : Depth,
            Label : '{i18n>Depth}',
        },
        {
            $Type : 'UI.DataField',
            Value : unitOfMeasure,
            Label : '{i18n>Unitofmeasure}',
        },]
);
annotate service.Items with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>DetallesItem}',
            ID : 'i18nDetallesItem',
            Target : '@UI.FieldGroup#i18nDetallesItem',
        },
    ],
    UI.FieldGroup #i18nDetallesItem : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Name,
                Label : '{i18n>Name}',
            },
            {
                $Type : 'UI.DataField',
                Value : Description,
                Label : '{i18n>Description}',
            },{
                $Type : 'UI.DataField',
                Value : Price,
                Label : '{i18n>Price}',
            },
            {
                $Type : 'UI.DataField',
                Value : Currency_ID,
                Label : '{i18n>Currencyid}',
            },{
                $Type : 'UI.DataField',
                Value : Quantity,
                Label : '{i18n>Quantity}',
            },
            {
                $Type : 'UI.DataField',
                Value : unitOfMeasure,
                Label : '{i18n>Unitofmeasure}',
            },{
                $Type : 'UI.DataField',
                Value : ReleaseDate,
                Label : '{i18n>Releasedate}',
            },
            {
                $Type : 'UI.DataField',
                Value : DiscontinuedDate,
                Label : '{i18n>Discontinueddate}',
            },
            {
                $Type : 'UI.DataField',
                Value : Height,
                Label : '{i18n>Height}',
            },{
                $Type : 'UI.DataField',
                Value : Width,
                Label : '{i18n>Width}',
            },{
                $Type : 'UI.DataField',
                Value : Depth,
                Label : '{i18n>Depth}',
            },],
    }
);
annotate service.Items with @(
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Item',
            ID : 'Item',
            Target : '@UI.FieldGroup#Item',
        },
    ],
    UI.FieldGroup #Item : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : OrderNumber,
                Label : 'OrderNumber',
            },{
                $Type : 'UI.DataField',
                Value : PositionNumber,
                Label : 'PositionNumber',
            },],
    }
);
