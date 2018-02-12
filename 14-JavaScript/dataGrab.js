console.log(dataSet)

// function activated on button click
function grabData(event) {

    d3.event.preventDefault();
    // remove previous query results
    d3.selectAll(".sightingsRow").remove()
    
    // retrieve query date from input box
    var queryData = {
        datetime: d3.select('#dateSearchValue').node().value,
        city: d3.select('#citySearchValue').node().value,
        state: d3.select('#stateSearchValue').node().value,
        country: d3.select('#countrySearchValue').node().value,
        shape: d3.select('#shapeSearchValue').node().value,
    };
    
    // change origial dataset to avoid mutation
    var filteredData = dataSet.concat();

    // loop through query data points and filter
    for (var key in queryData) {
        filteredData = filteredData.filter (function(data) {
            if (queryData[key] === "" || queryData[key] === data[key]) {
                return true;
            };
            return false;
        });
    };

    // return filter results
    console.log(filteredData);

    // define variable to count number of values returned
    console.log('there were ' + filteredData.length + ' sightings that fit the filter critera.')

    // loop through sightings 
    filteredData.forEach( function(sighting) {
        // append row to table element on html file
        var $tr = d3.select("#sightingsTable").append("tr").attr("class", "sightingsRow");

        // append table data
        $tr.append("td").text(sighting.datetime);
        $tr.append("td").text(sighting.city);
        $tr.append("td").text(sighting.state);
        $tr.append("td").text(sighting.country);
        $tr.append("td").text(sighting.shape);
    });
};

d3.select("#submit").on("click", grabData);