const cds = require("@sap/cds");

module.exports = (srv) => {
  const { Header, Items } = srv.entities;
 
  // Before hooks for Header entity 
  srv.before("CREATE", Header, onBeforeCreateHeader);
  srv.before("UPDATE", Header, onBeforeUpdateHeader);
  srv.before("DELETE", Header, onBeforeDeleteHeader);
 
  async function onBeforeReadHeader(req) {
 
    const query = SELECT.from("com_sales_order_Header").where({
      ID: req.data.ID,
    });
    let results1 = await cds.run(query);
  
    if (results1.length === 0) {
      return null;
    }
  
    const record = results1[0];
    const sOrderNumber = record.OrderNumber;
  
    const itemsQuery = SELECT.from("com_sales_order_Items").where({
      OrderNumber: sOrderNumber,
    });
    let itemsResults = await cds.run(itemsQuery);
  
    let headerData = {
      Email: record.Email,
      FirstName: record.FirstName,
      LastName: record.LastName,
      Country_ID: record.Country_ID,
      DeliveryDate: record.DeliveryDate,
      OrderStatus: record.OrderStatus,
      ImageURL: record.ImageURL,
      createdAt: record.createdAt,
      createdBy: record.createdBy,
      modifiedAt: record.modifiedAt,
      modifiedBy: record.modifiedBy,
      Items: itemsResults,
    };
  
    return headerData;
  }
   
  // Function to handle the creation of a new header
  async function onBeforeCreateHeader(req) {
 
    // Placeholder for the user who created the record
    const createdByUser = "SAP_USR_0001";

    // Initial order number
    const orderNumberInit = "90000001";

    // Current date and time in ISO format
    const currentDate = new Date().toISOString();

    let OrderNumberNew;
    let positionNumber = 0;

    req.data.createdAt = currentDate;
    req.data.createdBy = createdByUser;
    req.data.modifiedAt = currentDate;
    req.data.modifiedBy = createdByUser;

    const query = SELECT.from("com_sales_order_Header");
    let results = await cds.run(query);
    if (results.length === 0) {
      return null;
    }

    // Sort the results based on the OrderNumber in descending order
    results.sort((a, b) => b.OrderNumber - a.OrderNumber);

    // Return the first element (which has the highest OrderNumber)
    const lastRecord = results[0];
    if (lastRecord && lastRecord.OrderNumber) {
      try {
        // Set OrderNumber to Header
        OrderNumberNew = parseInt(lastRecord.OrderNumber, 10) + 1;
        OrderNumberNew.toString();
        req.data.OrderNumber = OrderNumberNew;

        // Retrieve the maximum position number for the specific order number
        const [result2] = await cds.run(
          SELECT.from(Items)
            .columns("max(PositionNumber) as maxPositionNumber")
            .where({ OrderNumber: req.data.OrderNumber })
        );

        positionNumber = result2.maxPositionNumber;
        positionNumber++;

        // Aquí asignamos el OrderNumber y PositionNumber a cada ítem
        if (req.data.Items && Array.isArray(req.data.Items)) {
          for (let item of req.data.Items) {
            if (!item.ID) {
              item.ID = uuidv4();
            }

            item.OrderNumber = OrderNumberNew;
            item.PositionNumber = positionNumber;
            positionNumber++;
          }
        }
      } catch (error) {
        console.error("Error al obtener el último número de orden:", error);
        req.error(500, error.message);
      }
    } else {
      req.data.data.OrderNumber = orderNumberInit;
    }
  }

  // Function to handle the update of a header
  async function onBeforeUpdateHeader(req) {
 
    let positionNumber = 0;

    const query = SELECT.from("com_sales_order_Header").where({
      ID: req.data.ID,
    });
    let results = await cds.run(query);
    if (results.length === 0) {
      return null;
    }

    const record = results[0];

    if (req.data.Items && Array.isArray(req.data.Items)) {
      // Obtener el OrderNumber del Header que se está actualizando
      const sOrderNumber = record.OrderNumber;

      // Obtener el máximo PositionNumber existente para este OrderNumber
      const [result] = await cds.run(
        SELECT.from(Items)
          .columns("max(PositionNumber) as maxPositionNumber")
          .where({ OrderNumber: sOrderNumber })
      );

      positionNumber = result.maxPositionNumber;

      // Recorrer los ítems y asignar OrderNumber y PositionNumber
      for (let item of req.data.Items) {
        if (!item.OrderNumber) {
          item.OrderNumber = sOrderNumber;
        }

        if (!item.PositionNumber) {
          positionNumber++;
          item.PositionNumber = positionNumber;
        }
      }
    }
  }

  // Function to handle the deletion of a header
  async function onBeforeDeleteHeader(req) {
 
    const query = SELECT.from("com_sales_order_Header").where({
      ID: req.data.ID,
    });
    let results = await cds.run(query);
    if (results.length === 0) {
      return null;
    }

    const record = results[0];

    try {
      // Delete associated items based on the order number
      await cds.run(
        DELETE.from(Items).where({ OrderNumber: record.OrderNumber })
      );
    } catch (error) {
      console.error(
        "Error while deleting items associated with the header:",
        error
      );
      req.error(500, error.message);
    }
  }

 
};
