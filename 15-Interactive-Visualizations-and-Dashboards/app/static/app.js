function init(sample) {
    sample = (sample === '' ? 'BB_940': sample)

    var sampleURL = `/sample/${sample}`
    var otuURL = '/otu'

    Plotly.d3.json(sampleURL, function(error, sampleResponse) {
    if (error) {
            console.warn(error);
        };

        var allVals = sampleResponse.sample_values;
        var allIDs = sampleResponse.otu_ids
        
        var pieValues = allVals.slice(0,10);
        var pieLabels = allIDs.slice(0,10);
    
        Plotly.d3.json(otuURL, function(error, otuResponse) {
            if (error) {
                console.warn(error);
            }
    
            var allDescriptions = [];
            allIDs.forEach( function(data) {
                allDescriptions.push(otuResponse[data]);
            })

            var pieDescriptions = allDescriptions.slice(0,10);

            var pieData = [{
                values: pieValues,
                labels: pieLabels,
                type: 'pie',
                hovertext: pieDescriptions,
                
            }];
                
            var bubbleData = [{
                x: allIDs,
                y: allVals,
                mode: 'markers',
                text: allDescriptions,
                marker: {
                    color: allIDs,
                    size: allVals
                },
            }];

            Plotly.newPlot('pie', pieData);
            Plotly.newPlot('bubble', bubbleData);
        });
    });
};
/*
gather sample names and place in dropdown
*/
// api endpoint for sample names
var sampleNamesUrl = '/names'

Plotly.d3.json(sampleNamesUrl, function(error, sampleNames) {
    if (error) {
        return console.warn(error);
    };

    sampleNames.forEach( function(name) {
        Plotly.d3
        .select('#selDataset')
        .append('option')
        .attr('value', name)
        .attr('class', 'dropDownItem')
        .text(name)
    });
});

/*
function to capture changes to dropdown selection
*/

function optionChanged(sample) {
    
    sample = (sample === '' ? 'BB_940': sample)

    var sampleURL = `/sample/${sample}`
    var otuURL = '/otu'

    Plotly.d3.json(sampleURL, function(error, sampleResponse) {
        if (error) {
                console.warn(error);
            };
    
        var allVals = sampleResponse.sample_values;
        var allIDs = sampleResponse.otu_ids
        
        var pieValues = allVals.slice(0,10);
        var pieLabels = allIDs.slice(0,10);
    
        Plotly.d3.json(otuURL, function(error, otuResponse) {
            if (error) {
                console.warn(error);
            }
    
            var allDescriptions = [];
            allIDs.forEach( function(data) {
                allDescriptions.push(otuResponse[data]);
            })

            var pieDescriptions = allDescriptions.slice(0,10);
            
            // restyle pie plot
            var $piePlot = document.getElementById('pie')
            Plotly.restyle($piePlot, 'values', [pieValues]);
            Plotly.restyle($piePlot, 'labels', [pieLabels]);
            Plotly.restyle($piePlot, 'hovertext', [pieDescriptions]);

            // restyle bubble plot
            var $bubblePlot = document.getElementById('bubble')
            var markerProps = {
                color: allIDs,
                size: allVals
            }
            Plotly.restyle($bubblePlot, 'x', [allIDs]);
            Plotly.restyle($bubblePlot, 'y', [allVals]);
            Plotly.restyle($bubblePlot, 'marker', [markerProps]);
        });
    });
};

init("");