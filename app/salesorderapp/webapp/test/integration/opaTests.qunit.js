sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'salesorder/com/salesorderapp/test/integration/FirstJourney',
		'salesorder/com/salesorderapp/test/integration/pages/HeaderList',
		'salesorder/com/salesorderapp/test/integration/pages/HeaderObjectPage',
		'salesorder/com/salesorderapp/test/integration/pages/ItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, HeaderList, HeaderObjectPage, ItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('salesorder/com/salesorderapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheHeaderList: HeaderList,
					onTheHeaderObjectPage: HeaderObjectPage,
					onTheItemsObjectPage: ItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);