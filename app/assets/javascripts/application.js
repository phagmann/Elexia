// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require react
//= require react_ujs
//= require components
//= require jquery
//= require bootstrap
//= require taggle-full
//= require_tree .


// Tree.prototype.add = function(value){
//     var node = {
//         value: value,
//         next: null,
//         previous: [],
//         alpha: -Infinity,
//         beta: Infinity,
//         pruned: 0,
//         board: null,
//         uncontested: [],
//         gdex: 0
//     };

String.prototype.positionOf = function(start,endsubstr){
  for(var i =  1; i < this.length; i++){
    if(getPosition(this, endsubstr, i) > this.indexOf(start)){
      return getPosition(this, endsubstr, i)
    }
  }

}

function stopRKey(evt) { 
  var evt = (evt) ? evt : ((event) ? event : null); 
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
} 

document.onkeypress = stopRKey; 

function makeEven(arr){
    var maxLength = arr.sort(function (a, b) { return b.length - a.length; })[0].length;
    var return_array = [];
    for(var i = 0; i < arr.length; i++){
        var curr = arr[i];
        return_array.unshift("0".repeat(maxLength - curr.length) + curr);
    }
    return return_array

}

function leftIntroduce(div_id,time){
  $("#" + div_id.toString()).animate({left: '0px', opacity: '1.0'}, time, 'linear');
}

function fadein(div_id,time){
  $("#" + div_id.toString()).animate({ opacity: '1.0'}, time, 'linear');
}

function fadeout(div_id,time){
  $("#" + div_id.toString()).animate({ opacity: '0.0'}, time, 'linear');
}

function menuAjax(url){
    window.location.href = url.toString();
    }

function onlyUnique(arr) {
  var dups = [];
  var finalz = [];
  for(var i = 0; i < arr.length; i++){
      if(!dups.includes(arr[i].id.toString())){
          finalz.push(arr[i]);
          dups.push(arr[i].id.toString());
      }

  }
  return finalz
}

function subStringRange(str,start,end){
  var strFinal = ""
  console.log('yoz',str.positionOf(start,end),'hoz')
  for(var i =  0; i < str.length; i++){
    if(!(i >= str.indexOf(start) && i < str.positionOf(start,end))){
      strFinal += str[i];
    }
    
  }
  return strFinal.split(">").join("")
}

function getOffset(el) {
  el = el.getBoundingClientRect();
  return {
    left: el.left + window.scrollX,
    top: el.top + window.scrollY
  }
}

function spaceOutNotes(MainDivId,note_id,edit_id, save_id){
    var MainDiv = document.getElementById(MainDivId);
    var allNotes = document.querySelectorAll('[id^="note_')
    


    if(MainDiv.hidden){
      MainDiv.hidden = false;
    }else{
      MainDiv.hidden = true;
    }

    // TODO: give good spacing between note boxes! Also revert box back to original spot if conflicting box closes
    for(var i =0;i < allNotes.length; i++){
      var currBox = allNotes[i];

    }


    var NoteDiv = document.getElementById(note_id);
    var noteStr = subStringRange(subStringRange(NoteDiv.innerHTML,"<",">" ),"</",">")
    NoteDiv.innerHTML = noteStr;

    document.getElementById(save_id).style.visibility = "hidden";
    document.getElementById(edit_id).style.visibility = "visible";
}


function textBoxIn(MainDivId, edit_id, save_id){
    var MainDiv = document.getElementById(MainDivId);
    var mainStr = "<textarea rows='8' cols='25'>" + MainDiv.innerHTML.trim() + "</textarea>";
    MainDiv.innerHTML = mainStr;

    document.getElementById(edit_id).style.visibility = "hidden";
    document.getElementById(save_id).style.visibility = "visible";
}

function textBoxOut(MainDivId, edit_id, save_id, note_type, user_id, box_id){
    var MainDiv = document.getElementById(MainDivId);

    // var mainStr = subStringRange(subStringRange(MainDiv.childNodes[0].value.trim(),"<",">" ),"</",">")
    var mainStr = MainDiv.childNodes[0].value;
    MainDiv.innerHTML = mainStr;
    document.getElementById(save_id).style.visibility = "hidden";
    document.getElementById(edit_id).style.visibility = "visible";

    $.ajax({
                url: '../notes/new',
                dataType: 'json',
                data:  { main_string: mainStr, note_type: note_type, user_id: user_id, box_id: box_id },
                
                success: function(data){
                    console.log(data);
                }
              });



    // $.post("notes",
    // type: "POST",
    // {
    //     note_type: note_type, user_id: user_id, box_id: box_id
    // },
    // function(data){
    //     console.log("Data: " + data);
    // });


}



function getPosition(string, subString, index) {
   if(string.split(subString, index).join(subString).length == string.length){
    return 0;
   }
   return string.split(subString, index).join(subString).length;
}









 function google_search_word(q) {
    window.open('http://google.com/search?q='+q);
};

function addToNotes(defintion, box_id, user_id){

    removeElement("temp_dictionary");
    spaceOutNotes('note_paragraph_' + box_id.toString(),'note_paragraph_content_' + box_id.toString(),'note_paragraph_edit_' + box_id.toString(),'note_paragraph_save_' + box_id.toString());

    var mainDiv = document.getElementById('note_paragraph_content_' + box_id.toString());
    
    console.log("ughz")
    var mainStr = mainDiv.innerHTML.trim() + " " + defintion;
    console.log(mainStr)
    mainDiv.innerHTML = mainStr;

    // document.getElementById(save_id).style.visibility = "hidden";
    // document.getElementById(edit_id).style.visibility = "visible";

    $.ajax({
                url: '../notes/new',
                dataType: 'json',
                data:  { main_string: mainStr, note_type: 5, user_id: user_id, box_id: box_id },
                success: function(data){
                }
              });



}


function getSelectedText() {
    var text = "";
    if (typeof window.getSelection != "undefined") {
        text = window.getSelection().toString();
    } else if (typeof document.selection != "undefined" && document.selection.type == "Text") {
        text = document.selection.createRange().text;
    }
    //if(text.charAt(text.length - 1) )

    return text;
}

function removeElement(id) {
    var elem = document.getElementById(id);
    return elem.parentNode.removeChild(elem);
}





function doSomethingWithSelectedText(box_id,user_id) {
    var selectedText = getSelectedText().trim();
    if (selectedText) {

        if( !document.getElementById("temp_dictionary") && selectedText.replace(/ /g,'').length == selectedText.length){

            $.ajax({
            url: '/definition',
            type: 'get',
            data: {word: selectedText},
            complete: function(returned_def) {
         

                console.log(returned_def.responseText)
                if(returned_def.responseText.includes("Error in ToolsController") || returned_def.responseText.includes("We're sorry, but something went wrong.")){
                  returned_def.responseText = "there was an error in the definition search. Make sure to exclude plurals and puncuations!"
                } 
                x = window.getSelection().getRangeAt(0).getBoundingClientRect().x
                y = window.getSelection().getRangeAt(0).getBoundingClientRect().y
                var popupStr = "<hgroup id='another_dic_hgroup' class='dic-bubble text-left' style='min-width:100px;min-height:100px;'> \
                                    <br> \
                                    <span id='another_dic_span'>"
                popupStr += selectedText.toString()  + ": " + returned_def.responseText.toString()
                popupStr += "<br /><button id='google_search'>Google Search</button><br />"

                var mainDiv = document.getElementById('note_paragraph_content_' + box_id.toString());
                console.log("ughz_pre")
                var mainStr = mainDiv.innerHTML.trim();
                console.log(mainStr, mainStr.indexOf(selectedText.toString() + ":"))
                if( mainStr.indexOf(" " + selectedText.toString() + ":") == -1){
                  popupStr += "<button id='add_to_notes'>Add Definition To Notes</button>"
                }else{
                    popupStr += "<span>You already have this definition in your notes here!</span>"
                }

                popupStr += "</span></hgroup>" 
                                
                
                var div = document.createElement("div");
                div.id = "temp_dictionary";
                div.style.position = "fixed";
                div.style.left = x.toString() +'px';
                div.style.top = (y - 120).toString() +'px';
                div.innerHTML = popupStr;
                

                document.getElementById("para_" + box_id.toString()).appendChild(div); 
                document.getElementById("google_search").onclick = function() { google_search_word(selectedText.toString()) };
                if( mainStr.indexOf(" " + selectedText.toString() + ":") == -1){
                    document.getElementById("add_to_notes").onclick = function() { addToNotes(selectedText.toString()  + ": " + returned_def.responseText.toString(),box_id,user_id) };
                }
                // 
                }
                // error: function(returned_def) {
                //     console.log(returned_def.responseText)
                // }
            })
            //TODO: test if hightlighted word.trim() is just one word
            // text box right above hightlighted word
            // features (add to notes, says def, link to google search, close button + close if clicked anywhere else)

        }else{

            //document.getElementById("para").removeChild(document.getElementById("temp_dictionary")); 


        }
    }   
}

//document.getElementById("para").addEventListener("mouseup", doSomethingWithSelectedText);

// document.onmouseup = doSomethingWithSelectedText;
// document.onkeyup = doSomethingWithSelectedText;


// debug(subStringRange("<textarea rows='8' cols='25'> Bam </textarea>","<",">" ))

// debug(subStringRange("<textarea rows='8' cols='25'> Bam </textarea>","</",">" ))



// debug(subStringRange(subStringRange("<textarea rows='8' cols='25'> I Bam </textarea>","<",">" ),"</",">"))

//TODO: figure out way to dynamicly do the step by view solving process + make expression look better


//var sample = new AdditionView("12+16")
//debug(sample.expresion)


