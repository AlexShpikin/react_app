var DonutChartPath=React.createClass({
    propTypes: {
        width:React.PropTypes.number,
        height:React.PropTypes.number,
        data:React.PropTypes.array,
        pie:React.PropTypes.func,
        color:React.PropTypes.func
    },
    componentWillMount:function(){

        var radius=this.props.height;

        var outerRadius=radius/2;
        var innerRadius=radius/3.3;

        this.arc=d3.svg.arc()
            .outerRadius(outerRadius)
            .innerRadius(innerRadius);

        this.transform='translate('+radius/2+','+radius/2+')';

    },
    createChart:function(_self){

        var paths = (this.props.pie(this.props.data)).map(function(d, i) {

            return (
                <path fill={_self.props.color(i)} d={_self.arc(d)} key={i}/>
            )
        });
        return paths;
    },

    render:function(){


        var paths = this.createChart(this);

        return(
            <g transform={this.transform}>
                {paths}
            </g>
        )
    }
});

var DonutChartLegend=React.createClass({
    propTypes: {
        width:React.PropTypes.number,
        height:React.PropTypes.number,
        data:React.PropTypes.array,
        pie:React.PropTypes.func,
        color:React.PropTypes.func
    },
    createChart:function(_self){

        var texts = (this.props.pie(this.props.data)).map(function(d, i) {

            var transform="translate(10,"+i*30+")";

            var rectStyle = {
                fill:_self.props.color(i),
                stroke:_self.props.color(i)

            };

            var textStyle = {
                fill:_self.props.color(i)
            };

            return (
                <g transform={transform} key={i}>
                    <rect width="20" height="20" style={rectStyle} rx="2" rx="2"/>
                    <text x="30" y="15" className="legend" style={textStyle}>{d.data.title}</text>
                </g>
            )
        });
        return texts;
    },

    render:function(){

        var style={
            visibility:'visible'
        };

        if(this.props.width<=this.props.height+70){
            style.visibility='hidden';
        }

        var texts = this.createChart(this);
        var transform="translate("+(this.props.width/2+80)+",55)";
        return(
            <g is transform={transform} style={style}>
                {texts}
            </g>
        )
    }
});


var DonutChart=React.createClass({
    propTypes: {
        width:React.PropTypes.number,
        height:React.PropTypes.number,
        padAngle:React.PropTypes.number
    },

    getDefaultProps: function() {
        return {
            width: 450,
            height: 250,
            padAngle:0
        };
    },
    getInitialState:function(){
        return {
            data:[],
            width:0
        };
    },


    componentWillMount:function(){

        this.pie=d3.layout.pie()
            .value(function(d){return d.sportsmans_count})
            .padAngle(this.props.padAngle)
            .sort(null);

        this.color = d3.scale.ordinal()
            .range(['#68c8d7','#eccd63','#bb8cdd','#de6942','#52b36e','#bbc7d9']);

        this.setState({'data':this.props.data,width:this.props.width});
    },

    render:function(){

        return (
            <div>
                <svg id={this.props.id} width={this.state.width}

                     height={this.props.height} className="shadow">

                    <DonutChartPath width={this.state.width} height={this.props.height}
                                    pie={this.pie} color={this.color} data={this.state.data}/>

                    <DonutChartLegend pie={this.pie} color={this.color} data={this.state.data}
                                      width={this.state.width} height={this.props.height}/>

                </svg>
            </div>
        );
    }
});
