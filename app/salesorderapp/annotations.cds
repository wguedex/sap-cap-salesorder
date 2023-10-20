using SalesOrdersSrv as service from '../../srv/sales-order-srv';

annotate service.Header with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'OrderNumber',
            Value : OrderNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'FirstName',
            Value : FirstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'LastName',
            Value : LastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : Email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Country_ID',
            Value : Country_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : DeliveryDate,
            Label : 'DeliveryDate',
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
            Label : 'OrderStatus',
        },
    ]
);
annotate service.Header with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'OrderNumber',
                Value : OrderNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : Email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'FirstName',
                Value : FirstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'LastName',
                Value : LastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Country_ID',
                Value : Country_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'DeliveryDate',
                Value : DeliveryDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'OrderStatus',
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
    OrderNumber @Common.Label : 'OrderNumber'
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
            Label : 'OrderNumber',
        },
        {
            $Type : 'UI.DataField',
            Value : PositionNumber,
            Label : 'PositionNumber',
        },
        {
            $Type : 'UI.DataField',
            Value : Name,
            Label : 'Name',
        },{
            $Type : 'UI.DataField',
            Value : Description,
            Label : 'Description',
        },{
            $Type : 'UI.DataField',
            Value : Price,
            Label : 'Price',
        },
        {
            $Type : 'UI.DataField',
            Value : Currency_ID,
            Label : 'Currency_ID',
        },{
            $Type : 'UI.DataField',
            Value : Quantity,
            Label : 'Quantity',
        },{
            $Type : 'UI.DataField',
            Value : ReleaseDate,
            Label : 'ReleaseDate',
        },
        {
            $Type : 'UI.DataField',
            Value : DiscontinuedDate,
            Label : 'DiscontinuedDate',
        },
        {
            $Type : 'UI.DataField',
            Value : Height,
            Label : 'Height',
        },{
            $Type : 'UI.DataField',
            Value : Width,
            Label : 'Width',
        },
        {
            $Type : 'UI.DataField',
            Value : Depth,
            Label : 'Depth',
        },
        {
            $Type : 'UI.DataField',
            Value : unitOfMeasure,
            Label : 'unitOfMeasure',
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
                Label : 'Name',
            },
            {
                $Type : 'UI.DataField',
                Value : Description,
                Label : 'Description',
            },{
                $Type : 'UI.DataField',
                Value : Price,
                Label : 'Price',
            },
            {
                $Type : 'UI.DataField',
                Value : Currency_ID,
                Label : 'Currency_ID',
            },{
                $Type : 'UI.DataField',
                Value : Quantity,
                Label : 'Quantity',
            },
            {
                $Type : 'UI.DataField',
                Value : unitOfMeasure,
                Label : 'unitOfMeasure',
            },{
                $Type : 'UI.DataField',
                Value : ReleaseDate,
                Label : 'ReleaseDate',
            },
            {
                $Type : 'UI.DataField',
                Value : DiscontinuedDate,
                Label : 'DiscontinuedDate',
            },
            {
                $Type : 'UI.DataField',
                Value : Height,
                Label : 'Height',
            },{
                $Type : 'UI.DataField',
                Value : Width,
                Label : 'Width',
            },{
                $Type : 'UI.DataField',
                Value : Depth,
                Label : 'Depth',
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
