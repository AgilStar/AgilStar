/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function firstPlay(time,type){
    alert(type);
     if(type=="timeable"){
                 document.getElementById("btnExo").disabled =true;
                 document.getElementById("myprogressbar").removeAttribute("hidden");    
                 Load(time,type);
     }else{
         alert(type+"ssss");
                document.getElementById("btnExo").disabled =false;
                document.getElementById("myprogressbar").setAttribute("hidden",true);
            }
    
    
}


function changeDisplay(){
    
    var listExercice=document.getElementById("listExercice").getElementsByTagName("div");
 
    for(var i=0;i<listExercice.length;i++){
        if(listExercice[i].getAttribute("hidden")==null){
            //show
            //pour changer l'exercice
            listExercice[i].setAttribute("hidden",true);
            var time=listExercice[i+1].getAttribute("time");
            var type=listExercice[i+1].getAttribute("type");
            listExercice[i+1].removeAttribute("hidden");
            
            if(type=="timeable"||type=="repose"){
                 document.getElementById("btnExo").disabled =true;
                 document.getElementById("myprogressbar").removeAttribute("hidden");    
                 Load(time,type);

            }else{
                document.getElementById("btnExo").disabled =false;
                document.getElementById("myprogressbar").setAttribute("hidden",true);
            }
          
            
            
            
            //pour terminer une seance
            if(i==(listExercice.length-2)){
                document.getElementById("btnExo").innerHTML="Terminer";
                document.getElementById("btnExo").setAttribute("onClick","alert('Terminer')")
             }
            break;
        }
        
        
    }
    
}

function Load(secs,type){ 
    for(var i=secs;i>=0;i--) 
      { 
        window.setTimeout(doUpdate, (secs-i) * 1000,i,secs,type); 
} 
} 
function doUpdate(num,total,type){ 
   var message;
    if(type=="repose"){
        message="Repos pour";
        document.getElementById('ShowDiv').innerHTML = message+' '+num+' secs ' ; 
        document.getElementById("bar").style.width=num/total*100+"%";
       
    }else{
        message="Finir dans";
        document.getElementById('ShowDiv').innerHTML = message+' '+num+' secs ' ; 
        document.getElementById("bar").style.width=num/total*100+"%";
       
    }
      if(num == 0) { changeDisplay()} 
     
       
} 

function disableBtn(){
    document.getElementById("btnExo").disabled =false;
}

