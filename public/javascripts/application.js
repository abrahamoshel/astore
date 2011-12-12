// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
var natDays = [
                [8, 24], [8,25], [8, 26], [12, 25]
              ];

        function nationalDays(date) {
                for (i = 0; i < natDays.length; i++) {
                        if (date.getMonth() == natDays[i][0] - 1
                        && date.getDate() == natDays[i][1]) {
                                return [false, natDays[i][2] + '_day'];
                        }
                }
                return [true, ''];
        }


var myDate = new Date();
var toDay = myDate.getDay() +1;
switch (toDay) {
                case 1: // Sunday
                    dateSelected = '2w 4d'
                    break;
                case 2: // Monday
                    dateSelected = '2w 4d'
                    break;
                case 3: // Tuesday
                  dateSelected = '2w 4d'
                  break;
                case 4: // Wednesday
                     dateSelected = '2w 4d'
                    break;
                case 5: // Thursday
                     dateSelected = '2w 4d'
                    break;
                case 6: // Friday
                  //dateSelected = new Date(myDate.getFullYear(), 7 - 1, 15) + '3d'
                   dateSelected = '2w 4d'
                  //maxSelected = dateSelected + '3d'
                  break;
                case 7: // Saturday
                    dateSelected = '3w 4d'
                    //maxSelected = dateSelected + '3w'
                default:
                    break;
                }
  $("#request_startDate, #request_endDate, #holiday_firstStart, #holiday_firstEnd, #holiday_secondStart, #holiday_secondEnd, #holiday_thirdStart, #holiday_thirdEnd").datepicker({
    dateFormat: 'D M d, yy',
    minDate: dateSelected,
    beforeShowDay: nationalDays
  });
  $("#shift_date").datepicker({
    minDate: myDate,
    dateFormat: 'D M d, yy',
    beforeShowDay: nationalDays
  });
  $('#main').tinyscrollbar();
});

