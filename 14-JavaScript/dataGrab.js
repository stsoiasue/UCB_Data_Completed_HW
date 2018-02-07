console.log(dataSet)

// function activated on button click
function grabData(event) {

    d3.event.preventDefault();
    // remove previous query results
    d3.selectAll(".sightingsRow").remove()

    // retrieve query date from input box
    var $dateSearch = d3.select('#dateSearchValue').node().value;
    console.log('user is looking for sightings on: ' + $dateSearch)

    // define variable to count number of values returned
    sightingsCount = 0

    // loop through sightings 
    dataSet.forEach( function(sighting) {

        // verify date matches query date
        if (sighting.datetime === $dateSearch) {
            
            // append row to table element on html file
            var $tr = d3.select("#sightingsTable").append("tr").attr("class", "sightingsRow");

            // append table data
            $tr.append("td").text(sighting.datetime);
            $tr.append("td").text(sighting.city);
            $tr.append("td").text(sighting.state);
            $tr.append("td").text(sighting.country);
            $tr.append("td").text(sighting.shape);

            sightingsCount++;
        };  
    });
    console.log('there were ' + sightingsCount + ' sightings on ' + $dateSearch)
};

d3.select("#submit").on("click", grabData);

