/* ATTACH DATE PICKER METHOD TO THE CALENDAR */
Calendar.prototype.date_picker = function(links, theMonths, theWeekDays)
{
  var _this = this;
  var container = document.getElementById(this.id);
  var target_form = document.getElementById(this.datepicker);
  var inputs = target_form.getElementsByTagName("INPUT");
  var selects = target_form.getElementsByTagName("SELECT");

  for(i=0; i < links.length; i++)
  {
    /* POP-UP CALENDAR OPTION */
    if(this.popup)
    {
      var _this_ = _this;
      var icon = document.getElementById(this.popup);

      var startCalSelect = document.getElementById('startDateMonth');
      var endCalSelect = document.getElementById('endDateMonth');
      var startDateInput = document.getElementById('startDateInput');
      var endDateInput = document.getElementById('endDateInput');
      var startCalendar = document.getElementById('calendarStartDate');
      var endCalendar = document.getElementById('calendarEndDate');

      var startDate;
      var endDate;
      var startTempMonth;
      var endTempMonth;
      var startTempYear;
      var endTempYear;

      icon.onclick = function()
      {
      
      /*@cc_on
      if(document.getElementById("ie_mask")){
        var iframe = document.getElementById("ie_mask");
        var iframeParent = iframe.parentNode;
  
  				if(iframe) iframeParent.removeChild(iframe);
      }
      @*/
      
        if(startCalendar.style.display == "block" && startCalendar.id != container.id)
          startCalendar.style.display = "none";

        if(endCalendar.style.display == "block" && endCalendar.id != container.id)
          endCalendar.style.display = "none";

        container.style.display = "block";

        var startContainer = document.getElementById('startDate');
        var endContainer = document.getElementById('endDate');

        if(target_form.id == startContainer.id)
          endContainer.style.zIndex = "6";


        /*@cc_on

        var iframe = document.createElement("IFRAME");

        iframe.id = "ie_mask";
        iframe.style.width = container.offsetWidth - 43;
        iframe.style.height = container.offsetHeight;
        iframe.style.top = container.offsetTop;
        iframe.style.left = container.offsetLeft;
        iframe.setAttribute("frameBorder", 0);
        if(!document.getElementById("ie_mask")) container.parentNode.appendChild(iframe);

        @*/

        /* GET MONTH FROM STARTING MONTH SELECT BOX */

        if (startCalendar.id == container.id)
        {
          //alert(startCalSelect.value);
          startDate = startCalSelect.value;
          startTempMonth = startDate.substr(4);
          startTempYear = startDate.substring(0, 4);
          //alert(startTempYear);
          if(startTempMonth.charAt(0) == "0")
            startTempMonth = startTempMonth.substr(1);
          //alert(Number(startTempMonth) - 1);

          finalMonth = Number(startTempMonth);
          finalYear = Number(startTempYear);

          get_month = (finalMonth - 1);
          get_year = finalYear;
          counter = (finalMonth - 1);

          _this_.build(theMonths, theWeekDays);

        }

        /* GET MONTH FROM ENDING MONTH SELECT BOX */
        if (endCalendar.id == container.id)
        {
          endDate = endCalSelect.value;
          //alert(endCalSelect.value);
          endTempMonth = endDate.substr(4);
          endTempYear = endDate.substring(0, 4);
          if(endTempMonth.charAt(0) == "0")
            endTempMonth = endTempMonth.substr(1);
          //alert(Number(startTempMonth) - 1);

          finalMonth = Number(endTempMonth);
          finalYear = Number(endTempYear);

          get_month = (finalMonth - 1);
          get_year = finalYear;
          counter = (finalMonth - 1);

          _this_.build(theMonths, theWeekDays);

        }

        if(!document.all)
        {
          container.style.left = ((this.offsetLeft + (this.offsetWidth + 10)) + "px");
          container.style.top = ((this.offsetTop - this.offsetHeight) + "px");
        }
        return false;
      }

      this.addEvent(links[i], "click", function()
      {
        container.style.display = "none";
        return false;
      });
    }

    /* DATE SELECTION */
    links[i].onclick = function()
    {
      _this.selected_date = this.rel;

      /* MARK SELECTED DATE */
      for(x=0; x < links.length; x++)
      {
        links[x].parentNode.className = links[x].parentNode.className.replace("selectedDate", "");
      }

      this.parentNode.className += " selectedDate";

      var temp = this.rel.split("/");

      /* DATE ENTRY - INPUT */
      if(inputs)
      {
        /* SINGLE INPUT FOR DATE */

        if(inputs.length == 1){
          if(inputs[0].className.match(/day\b/)){
           inputs[0].value = parseInt(temp[1]);
          } else
            inputs[0].value = this.rel;
        }

      }

      /* GET END MONTH AND YEAR FIRST */

      if(endCalSelect){

        var endDate = endCalSelect.value;
        //alert(endCalSelect.value);
        var endTempMonth = endDate.substr(4);
        var endTempYear = endDate.substring(0, 4);
        if(endTempMonth.charAt(0) == "0")
          endTempMonth = endTempMonth.substr(1);

      }

      //alert(endMonth+", "+endYear);

      /* DATE ENTRY - SELECT */
      if(selects)
      {
        if(selects[0].id.match(/datemonth/gi))
        {
          var month = parseInt(temp[0])+"";
          if(month.length==1){
            month = "0"+month;
          }
          var year = parseInt(temp[2])+"";

          var yearMonth = year+month;

          for(i=0; i < selects[0].options.length; i++)
          {
            if(selects[0].options[i].value == yearMonth) selects[0].options[i].selected = true;
          }

          if(selects[0].id.match(/startdatemonth/gi)){
            //alert("Start Date: "+month+"/"+year);
            //alert("End Date: "+endTempMonth+"/"+endTempYear);

            var startYear = Number(year);
            var startMonth = Number(month);

            var endYear = Number(endTempYear);
            var endMonth = Number(endTempMonth);

            //alert(startYear+startMonth+endYear+endMonth);

            var startDay = Number(startDateInput.value);
            var endDay = Number(endDateInput.value);

            if(startYear == endYear && startMonth > endMonth){
              for(i=0; i < endCalSelect.options.length; i++){
                if(endCalSelect.options[i].value == yearMonth) endCalSelect.options[i].selected = true;
              }
              endDateInput.value = parseInt(temp[1]);
            }
            else if(startYear > endYear){
              for(i=0; i < endCalSelect.options.length; i++){
                if(endCalSelect.options[i].value == yearMonth) endCalSelect.options[i].selected = true;
              }
              endDateInput.value = parseInt(temp[1]);

            }
            else if(startYear == endYear && startMonth == endMonth && startDay > endDay){
              endDateInput.value = parseInt(temp[1]);
            }

          }

        }

      }


      /*@cc_on

      var iframe = document.getElementById("ie_mask");
      var iframeParent = iframe.parentNode;

				if(iframe) iframeParent.removeChild(iframe);

      @*/

      return false;
    }
  }
}

/* KEEP TRACK OF THE SELECTED DATE */
Calendar.prototype.track_selected = function(links)
{
  if(this.selected_date != null)
  {
    for(i=0; i < links.length; i++)
    {
      if(links[i].title == this.selected_date) links[i].parentNode.className += " selectedDate";
    }
  }
}