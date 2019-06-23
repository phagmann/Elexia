function SubtractionView(expresion,divID,rowID,colID){
    this.expresion = makeEven(expresion.split('-')).join('-');
    this.divID = divID;
    this.row_identifier = rowID;
    this.col_identifier = colID;
    this.height = null;
    this.wide = null;
    this.digit_values_align = null;
    this.reminder  = 0;

}

// 6/22/19 Patrick: makes the ui view, mostly hardcoded 
SubtractionView.prototype.equationMake = function(){
    var wide = this.expresion.split('-').sort(function (a, b) { return b.length - a.length; })[0].length + 1;
    var height = this.expresion.split('-').length + 2;
    this.height = height - 1;
    this.wide = wide - 1;
    
    var digit_values_align = this.expresion.split('-');

    this.digit_values_align = digit_values_align;
    var mainDiv = document.getElementById(this.divID);
    mainDiv.innerHTML = "";
    mainDiv.className = "container";
    mainDiv.style = "width:"+ 4.5*wide +"%;";
    for(var l = 0; l < height; l++){
        var curr_row = document.createElement('div');

        curr_row.id = this.row_identifier + "_" + l;
        curr_row.className = "nopadding";
        curr_row.style = "display: grid; grid-template-columns: repeat(" + (wide + 1).toString() + ", 1fr);";
        if( l == height - 2){
            curr_row.style = "display: grid; grid-template-columns: repeat(" + (wide + 1).toString() + ", 1fr);border-bottom: 3px solid black;";
        }
        for(var w = 0; w < wide; w++){

            if( l == height - 2 && w == 0){
                var curr_col = document.createElement('div');
                //curr_col.className = "nopadding"
                curr_col.innerHTML = "-";
                curr_col.id = this.col_identifier + "_" + l + "_" + w + "_minus";
                curr_row.appendChild(curr_col);

                var curr_col = document.createElement('div');
                //curr_col.className = "nopadding";
                curr_col.innerHTML = "&nbsp";
                curr_col.id = this.col_identifier + "_" + l + "_" + w;
                curr_row.appendChild(curr_col);

                continue;
            }

            else if(w == 0){
                var curr_col = document.createElement('div');
                //curr_col.className = "nopadding"
                curr_col.innerHTML = "&nbsp";
                curr_col.id = this.col_identifier + "_" + l + "_" + w + "_minusholder";
                curr_row.appendChild(curr_col);

                var curr_col = document.createElement('div');
                //curr_col.className = "nopadding"
                curr_col.innerHTML = "&nbsp";
                curr_col.id = this.col_identifier + "_" + l + "_" + w;
                curr_row.appendChild(curr_col);

                continue;
            }

            else{
                var curr_col = document.createElement('div');
                curr_col.id = this.col_identifier + "_" + l + "_" + w;
                //curr_col.className = "nopadding" 
                curr_col.innerHTML = "&nbsp";
            }
            if(l >= 1 && l < height - 1){
                if(w >= 1 && w < wide){
                     if(digit_values_align[l-1].isLeadingZero(w-1)){
                        curr_col.innerHTML = "&nbsp";
                    }
                    else{
                        //only place real values go
                        //curr_col.innerHTML = digit_values_align[l-1][w-1];
                        console.log(digit_values_align,': ', '(',l-1,',',w-1,')','<=>', '(',height - l - 2,',',w-1,')' )
                        // switch around here
                        curr_col.innerHTML = digit_values_align[height - l - 2][w-1];
                    }
                    //curr_col.innerHTML = "1"
                }
            }
            curr_row.appendChild(curr_col);
        }
        mainDiv.appendChild(curr_row);
    }
}

SubtractionView.prototype.progress = function(x,y){
    //dynamicly add digitX digitY
    console.log("y: ",y , this.height)
    if(y == this.height){
        var num1 = parseInt(this.digit_values_align[0][x-1] || "0");
        for(var i = 1; i < this.height - 1; i++){
            num1 -= parseInt(this.digit_values_align[i][x-1] || "0");
        }
        console.log("num1: ",num1)
        var targetDiv = document.getElementById(this.col_identifier + "_" + y + "_" + x);
        var answer = (num1 + this.reminder).toString();
        

        if(x == 0 && y == this.height && answer == 0){
            return 0;
        }
        else if(answer.length > 1){
          targetDiv.innerHTML = "<green>" + answer.charAt(1) + "</green>";
          this.reminder = parseInt(answer.charAt(0));
        }
        else{
          targetDiv.innerHTML = "<green>" + answer + "</green>";
          this.reminder = 0;
        }
        
    }
    else{
        var num1 = parseInt(this.digit_values_align[0][x-1] || "0");
        for(var i = 1; i < this.height - 1; i++){
            num1 -= parseInt(this.digit_values_align[i][x] || "0");
        }
        var targetDiv = document.getElementById(this.col_identifier + "_" + y + "_" + x);
        var answer = (num1 + this.reminder).toString();
        console.log(x,y,"-",num1,this.reminder,"--",this.col_identifier + "_" + y + "_" + x)
        if(answer.length > 1){
            targetDiv.innerHTML = "<green>" + answer.charAt(0) + "</green>";
            
        }
        
    }
}


String.prototype.isLeadingZero = function(pos){
    for(var i = 0; i <= pos; i++){
        if(this[i] != "0"){
            return false
        }
    }
    return true
}

//   function setUpSubtraction (showID, inputval, valID, subvalID){
//     var euq = new SubtractionView(document.getElementById(inputval).value, showID, valID, subvalID);
//     euq.equationMake();
// }

function showSubtraction (showID, inputval, valID, subvalID){
    var euq = new SubtractionView(document.getElementById(inputval).value, showID, valID, subvalID);
    console.log(euq)
    euq.equationMake();
    var curr_x = euq.wide;
    var curr_y = euq.height;
    var clear;
    function repeating() {
        euq.progress(curr_x, curr_y);
        if(curr_y == euq.height){
            curr_y = 0;
            curr_x -= 1;
        }else if(curr_y == 0){
            curr_y = euq.height;
        }
        if(curr_x == -1){
            clearInterval(clear);
        } 
    }
    clear = setInterval(repeating, 1000);
}