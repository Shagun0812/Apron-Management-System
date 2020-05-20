window.addEventListener("load",init);

var jsonArr = [];
const airlineUrl = 'https://aviation-edge.com/v2/public/airlineDatabase?key=d3a85f-321cfb&codeIso2Country=IN';

var airportArr = [];
const airportUrl = "https://aviation-edge.com/v2/public/airportDatabase?key=d3a85f-321cfb";

var departureArr = [];
const departureUrl = "http://aviation-edge.com/v2/public/timetable?key=d3a85f-321cfb&iataCode=DEL&type=departure";

var arrivalArr = [];
const arrivalUrl = "http://aviation-edge.com/v2/public/timetable?key=d3a85f-321cfb&iataCode=DEL&type=arrival";

var home;
var airdb;
var schedule;
var airport;
var sec_home;
var sec_airdb;
var sec_schedule;
var sec_airport;
var arrival_tab;

function init(){
    home = document.getElementById("home");
    airdb = document.getElementById("airdb");
    airport = document.getElementById("airport")
    schedule = document.getElementById("schedule");
    sec_home = document.getElementById("sec_home");
    sec_airdb = document.getElementById("sec_airdb");
    sec_schedule = document.getElementById("sec_schedule");
    sec_airport = document.getElementById("sec_airport");
    arrival_tab = document.getElementById("arrival-tab");

    home.addEventListener("click",goHome);
    airdb.addEventListener("click",goAirdb);
    schedule.addEventListener("click",goSchedule);
    airport.addEventListener("click",goAirport);
    arrival_tab.addEventListener("click",arrival);

    fetch(airlineUrl)
    .then(data=>{return data.json()})
    .then(res=>{ jsonArr = res })
    .catch(error=>{ console.log(error) })

    fetch(airportUrl)
    .then(data=>{ return data.json() })
    .then(res=>{ airportArr = res })
    .catch(error=>{ console.log(error) })

    fetch(departureUrl)
    .then(data=>{ return data.json() })
    .then(res=>{ departureArr = res })
    .catch(error=>{ console.log(error) })

    fetch(arrivalUrl)
    .then(data=>{ return data.json() })
    .then(res=>{ arrivalArr = res })
    .catch(error=>{ console.log(error) })

}

function goHome(){
    sec_home.style.display="block";
    sec_airdb.style.display="none";
    sec_schedule.style.display="none";
    sec_airport.style.display="none";
}

function goAirdb(){
    sec_home.style.display="none";
    sec_airdb.style.display="block";
    sec_schedule.style.display="none";
    sec_airport.style.display="none";

    var table = document.getElementById("airdb_table");

    for(var i=0; i<jsonArr.length;i++){

        var tr=document.createElement('tr');

        var nameAirline=tr.appendChild(document.createElement('td'));
        nameAirline.innerHTML = jsonArr[i].nameAirline;

        var type=tr.appendChild(document.createElement('td'));
        type.innerHTML = jsonArr[i].type;

        var statusAirline=tr.appendChild(document.createElement('td'));
        statusAirline.innerHTML = jsonArr[i].statusAirline;

        var founding=tr.appendChild(document.createElement('td'));
        founding.innerHTML = jsonArr[i].founding;

        var nameCountry=tr.appendChild(document.createElement('td'));
        nameCountry.innerHTML = jsonArr[i].nameCountry;

        table.appendChild(tr);
        
    }

}

function goAirport(){
    sec_home.style.display="none";
    sec_airdb.style.display="none";
    sec_schedule.style.display="none";
    sec_airport.style.display="block";

    var table = document.getElementById("airport_table");
    var mapEndpoint = "https://www.google.com/maps/search/?api=1&query=";

    for(var i=0; i<airportArr.length; i++){
        if(airportArr[i].codeIso2Country == "IN"){
        var tr = document.createElement("tr");

        var nameAirport = tr.appendChild(document.createElement("td"));
        nameAirport.innerHTML = airportArr[i].nameAirport;

        var timezone = tr.appendChild(document.createElement("td"));
        timezone.innerHTML = airportArr[i].timezone;

        var nameCountry = tr.appendChild(document.createElement("td"));
        nameCountry.innerHTML = airportArr[i].nameCountry;

        var viewMap = tr.appendChild(document.createElement("td"));
        viewMap.innerHTML = "<a href='" + mapEndpoint + airportArr[i].latitudeAirport + "," + airportArr[i].longitudeAirport + "' target='_blank'><i class='fas fa-map-marker-alt' style='color:#EA4335;font-size:125%;'></i></a>";
        viewMap.style.textAlign = "center";

        table.appendChild(tr);
        }
    }

}

function goSchedule(){
    sec_home.style.display="none";
    sec_airdb.style.display="none";
    sec_schedule.style.display="block";
    sec_airport.style.display="none";

    var departTable = document.getElementById("departTable");

    for(var i=0;departureArr.length;i++){
        var departDate = new Date(departureArr[i].departure.estimatedRunway || departureArr[i].departure.estimatedTime || departureArr[i].departure.actualRunway || departureArr[i].departure.actualTime || departureArr[i].departure.scheduledTime);
        if(new Date() <= departDate){
            var tr = document.createElement("tr");

            var airline = tr.appendChild(document.createElement("td"));
            airline.innerHTML = departureArr[i].airline.name;

            var to = tr.appendChild(document.createElement("td"));
            for(var j=0;j<airportArr.length;j++){
                if(departureArr[i].arrival.iataCode == airportArr[j].codeIataAirport){
                    to.innerHTML = airportArr[j].nameAirport;
                }
            }

            var depart = tr.appendChild(document.createElement("td"));
            depart.innerHTML = departDate.getHours()+":"+departDate.getMinutes();

            var arrive = tr.appendChild(document.createElement("td"));
            var arriveDate = new Date(departureArr[i].arrival.estimatedRunway || departureArr[i].arrival.estimatedTime || departureArr[i].arrival.actualRunway || departureArr[i].arrival.actualTime || departureArr[i].arrival.scheduledTime);
            arrive.innerHTML = arriveDate.getHours()+":"+arriveDate.getMinutes();

            var status = tr.appendChild(document.createElement("td"));
            status.innerHTML = departureArr[i].status;

            departTable.appendChild(tr);
        }
    }
}

function arrival(){
    var arriveTable = document.getElementById("arriveTable");

    for(var i=0;arrivalArr.length;i++){
        var arriveDate = new Date(arrivalArr[i].arrival.estimatedRunway || arrivalArr[i].arrival.estimatedTime || arrivalArr[i].arrival.actualRunway || arrivalArr[i].arrival.actualTime || arrivalArr[i].arrival.scheduledTime);
        if(new Date() <= arriveDate){
            var tr = document.createElement("tr");

            var airline = tr.appendChild(document.createElement("td"));
            airline.innerHTML = arrivalArr[i].airline.name;

            var to = tr.appendChild(document.createElement("td"));
            for(var j=0;j<airportArr.length;j++){
                if(arrivalArr[i].departure.iataCode == airportArr[j].codeIataAirport){
                    to.innerHTML = airportArr[j].nameAirport;
                }
            }

            var depart = tr.appendChild(document.createElement("td"));
            var departDate = new Date(arrivalArr[i].departure.estimatedRunway || arrivalArr[i].departure.estimatedTime || arrivalArr[i].departure.actualRunway || arrivalArr[i].departure.actualTime || arrivalArr[i].departure.scheduledTime);
            depart.innerHTML = departDate.getHours()+":"+departDate.getMinutes();

            var arrive = tr.appendChild(document.createElement("td"));
            arrive.innerHTML = arriveDate.getHours()+":"+arriveDate.getMinutes();

            var status = tr.appendChild(document.createElement("td"));
            status.innerHTML = arrivalArr[i].status;

            arriveTable.appendChild(tr);
        }
    }
}
