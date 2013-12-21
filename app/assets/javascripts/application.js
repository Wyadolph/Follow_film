// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//=require jquery
//=require jquery_ujs
//=require bootstrap
//=require turbolinks


//=require_tree .
var mapFinal;
 var lat=new Array();
    var lng=new Array();
function initialize()
  {
    var myLatlng = new google.maps.LatLng(-34.397, 150.644);
        var mapOptions = {
          zoom: 4,
          center: myLatlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
      mapFinal=map;
  }
function searchmap(location,names){
   //先从输入框中取出要搜的地名
   //var address=$("#check_box").val();
   alert("fuck");
    var address=location;
    var printname=" " ;
    //var name0=name;
    for (var i = 0; i <names.length; i++) {
      printname+=printname+" "+names[i];
    };
   if(" "==address){
      alert("Please enter the name!!");
      return false;
   }else{
    geocoder = new google.maps.Geocoder(); //注意:还有一个全局的 var geocoder 对象
    if(geocoder){
      geocoder.geocode({'address': address }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          var GeoCode = ((results[0].geometry.location).toString().replace(/[()]/g, '')).split(",",2);
        var lat = parseFloat(GeoCode[0]);//纬度
        var lng = parseFloat(GeoCode[1]);//经度
        var mylatlng = new google.maps.LatLng(lat, lng);  
        mapFinal.setCenter(mylatlng);                                         
        //对搜索到的这个点进行标注
                        var marker = new google.maps.Marker({
          map: mapFinal,
          position: mylatlng,
          title:address
        });
marker.setMap(mapFinal);
var infowindow = new google.maps.InfoWindow({
  });
google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(printname);
  infowindow.open(mapFinal,marker);
  });
          } else {
        alert("谷歌地图没有找到的原因是:" + status);
        }
        });
      }
   }
} 


function search(){
   //先从输入框中取出要搜的地名
   var address=$("#check_box").val();
   alert("fuck");
    //var address=;
    var printname=" " ;
    //var name0=name;
   if(" "==address){
      alert("Please enter the name!!");
      return false;
   }else{
    geocoder = new google.maps.Geocoder(); //注意:还有一个全局的 var geocoder 对象
    if(geocoder){
      geocoder.geocode({'address': address }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          var GeoCode = ((results[0].geometry.location).toString().replace(/[()]/g, '')).split(",",2);
        var lat = parseFloat(GeoCode[0]);//纬度
        var lng = parseFloat(GeoCode[1]);//经度
        var mylatlng = new google.maps.LatLng(lat, lng);  
        mapFinal.setCenter(mylatlng);                                         
        //对搜索到的这个点进行标注
                        var marker = new google.maps.Marker({
          map: mapFinal,
          position: mylatlng,
          title:address
        });
marker.setMap(mapFinal);
var infowindow = new google.maps.InfoWindow({
  });
google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(printname);
  infowindow.open(mapFinal,marker);
  });
          } else {
        alert("谷歌地图没有找到的原因是:" + status);
        }
        });
      }
   }
} 

function drawRoute(route)
{
    var lineCoordinates=new Array();
    var line=new Array();
     var j=0; 
  for (var i = 0; i <route.length; i++) {
  //  var addr1=route[i-1];
    var addr2=route[i];
   
    geocoder1 = new google.maps.Geocoder(); //注意:还有一个全局的 var geocoder 对象
    geocoder2 = new google.maps.Geocoder();
    if(geocoder1 ){
      geocoder1.geocode({'address': addr2 },
       function(results, status) 
       {
        if (status == google.maps.GeocoderStatus.OK) 
        {
          var GeoCode1 = ((results[0].geometry.location).toString().replace(/[()]/g, '')).split(",",2);
           lat[j] = parseFloat(GeoCode1[0]);//纬度
           lng[j] = parseFloat(GeoCode1[1]);//经度
           lineCoordinates.push(new google.maps.LatLng(lat[j],lng[j]));
           j++;
          var mylatlng = new google.maps.LatLng(lat[j-1], lng[j-1]);  
           mapFinal.setCenter(mylatlng); 
          var marker = new google.maps.Marker({
          map: mapFinal,
          position: mylatlng,
          title:"hehe"
        });
       }
      if(j==route.length) 
        line = new google.maps.Polyline({
          path: lineCoordinates,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 1.0,
          strokeWeight: 2
        });
        line.setMap(mapFinal);
     }
     );}}
   
}

function seelocation(route)
{
  alert("fff");
  alert(route.length);
  var j=0;
   for (var i = 0; i <route.length; i++) {
  //  var addr1=route[i-1];
    var addr2=route[i];
    geocoder1 = new google.maps.Geocoder(); //注意:还有一个全局的 var geocoder 对象
    if(geocoder1 ){
      geocoder1.geocode({'address': addr2 },
       function(results, status) 
       {
        if (status == google.maps.GeocoderStatus.OK) 
        {
          var GeoCode1 = ((results[0].geometry.location).toString().replace(/[()]/g, '')).split(",",2);
           lat[j] = parseFloat(GeoCode1[0]);//纬度
           lng[j] = parseFloat(GeoCode1[1]);//经度
           alert(lat[j]);
           alert(lng[j]);
            j++;
          var mylatlng = new google.maps.LatLng(lat[j-1], lng[j-1]);  
           mapFinal.setCenter(mylatlng); 
          var marker = new google.maps.Marker({
          map: mapFinal,
          position: mylatlng,
          title:"hehe"
        });
       }
     }
     );
    }
  }
}