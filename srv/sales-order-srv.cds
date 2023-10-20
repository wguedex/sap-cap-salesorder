using {com.sales.order as so} from '../db/sales-order-schema';


service SalesOrdersSrv @(path: '/SalesOrder') {
     
  @odata.draft.enabled 
  entity Header     as projection on so.Header; 
  entity Items      as projection on so.Items;
  entity Currencies as projection on so.Currencies;
  entity Countries as projection on so.Countries;

 
}
