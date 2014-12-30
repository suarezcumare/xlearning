

//funciones estadisticas
 $(document).ready(function(){

   
/****************************************************************************/
/**                Grafico thermometer                                     */
/***************************************************************************/
           var thermometer = new RGraph.Thermometer({
                id: 'thermometer',
                min: 0,
                max: 100,
                value: 33,
                options: {
                    scale: {
                        visible: true
                    },
                    gutter: {
                        left: 50
                    }
                }
            }).grow()


 
/****************************************************************************/
/**                Grafico circularchar                                    */
/***************************************************************************/
           var meter = new RGraph.Meter({
                id: 'circularchar',
                min: -100,
                max: 100,
                value: 0,
                options: {
                    angles: {
                        start: RGraph.PI - 0.5,
                        end: RGraph.TWOPI + 0.5
                    },
                    linewidth: {
                        segments: 12
                    },
                    text: {
                        size: 12
                    },
                    strokestyle: 'white',
                    segment: {
                        radius: {
                            start: 99
                        }
                    },
                    needle: {
                        radius: 75
                    },
                    border: 0,
                    tickmarks: {
                        small: {
                            num: 0
                        },
                        big: {
                            num: 0
                        }
                    },
                    colors: {
                        ranges: [[-100,-4, '#F44049'],[-4,50, '#EBFA63'],[50,100, '#2FE99F']]
                    },
                    centery: 155,
                    radius: 120,
                    adjustable: false
            }
        }).draw()

/****************************************************************************/
/**                Grafico skeleton                                        */
/***************************************************************************/
	 var gauge = new RGraph.Gauge({
                id: 'skeleton',
                min: 0,
                max: 100,
                value: 46,
                options: {
                    'centery': 120,
                    'radius': 130,
                    'angles.start': RGraph.PI,
                    'angles.end': RGraph.TWOPI,
                    'needle.size': 100,
                    'border.width': 0,
                    shadow: false,
                    
                    'colors.ranges': [[0,33,'#2FE99F'], [33,66,'#EBFA63'],[67,100,'#F44049']],
                    'border.inner': 'rgba(0,0,0,0)',
                    'border.outer': 'rgba(0,0,0,0)',
                    'border.outline': 'rgba(0,0,0,0)',
                    
                    'centerpin.radius': 0
                }
            }).grow()


    });