var BarChart = React.createClass({
    getDefaultProps: function() {
        return {
            width: 300,
            height: 100,
            chartId: 'v_chart'
        };
    },
    getInitialState:function(){
        return {
            width:300
        };
    },
     componentWillMount: function(){
        console.log(this.props.data)
    },

    render:function(){
        var data= this.props.data;

        var margin={top:0,right:0,bottom:0,left:0},
        w=this.state.width-(margin.left+margin.right),
        h=this.props.height-(margin.top+margin.bottom);

        var transform='translate('+margin.left+','+margin.top+')';

        var x=d3.scale.ordinal()
            .domain(data.map(function(d){
                return d.title;
            }))
            .rangeRoundBands([0,this.state.width],.35);

        var y=d3.scale.linear()
            .domain([0,40])
            .range([this.props.height,0]);

        


        var rectBackground=(data).map(function(d, i) {

            return (
                <rect fill="#58657f" rx="3" ry="3" key={i}
                      x={x(d.title)} y={margin.top-margin.bottom}
                      height={h}
                      width={x.rangeBand()}/>

            )
        });

        var rectForeground=(data).map(function(d, i) {
            return (
                <rect fill="#74d3eb" rx="3" ry="3" key={i}
                      x={x(d.title)} y={y(d.competitions)} className="shadow"
                      height={h-d.competitions}
                      width={x.rangeBand()}/>
            )
        });

        return(
            <div>
                <svg id={this.props.chartId} width={this.state.width}
                     height={this.props.height}>

                    <g transform={transform}>
                        {rectBackground}
                        {rectForeground}
                    </g>
                </svg>
            </div>
            );
    }

});
