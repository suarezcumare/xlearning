
//funciones estadisticas individuales

function estadisticosBar() {
   

 /****************************************************************************/
/**                      Grafico bar                                        */
/***************************************************************************/
    var data = [4,8,6,3,5,2,6,8,4,5,7,8];

            var bar = new RGraph.Bar({
                id: 'bar',
                data: data,
                options: {
                    background: {
                        grid: {
                            autofit: {
                                numvlines: data.length
                            }
                        }
                    },
                    linewidth: 1,
                    shadow: {
                        offsetx: 3,
                        offsety: -3,
                        blur: 3,
                        color: '#fff'
                    },
                    hmargin: 5,
                    colors: ['#8BD6DF'],
                    labels: ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
                    clearto: 'white'
                }
            })
                
            RGraph.ISOLD ? bar.draw() : bar.wave({frames: 0})


}


function estadisticoscircularchar() {
   
 /****************************************************************************/
/**                      Grafico bar                                        */
/***************************************************************************/
    var data = [4,8,6,3,5,2,6,8,4,5,7,8];

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
                        segments: 15
                    },
                    text: {
                        size: 16
                    },
                    strokestyle: 'white',
                    segment: {
                        radius: {
                            start: 95
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
                        ranges: [[-100,-6, '#F44049'],[-5,5, '#EBFA63'],[6,100, '#2FE99F']]
                    },
                    centery: 155,
                    radius: 125,
                    adjustable: false
            }
        }).draw()


}

function estadisticosPie() {


/****************************************************************************/
/**                Grafico pie                                        */
/***************************************************************************/
      var pie = new RGraph.Pie({
                id: 'Pie',
                data: [9,5,12,8,4,9,2],
                options: {
                    strokestyle: '#fff',
                    linewidth: 2,
                    shadow: {
                        self: true,
                        blur: 5,
                        offsetx: 5,
                        offsety: 5,
                        color: '#fff'
                    },
                    exploded: 10,
                    radius: 80,
                    labels: {
                        self: ['Lunes','Martes','Miercoles','jueves','Viernes','Sabado','Domingo'],
                        sticks:true,
                        length: 15
                    }
                }
            })

            
            !RGraph.ISIE || RGraph.ISIE9UP ? pie.roundRobin({frames:30}) : pie.draw();
          


}


function estadisticosSkeleton() {

       

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


}