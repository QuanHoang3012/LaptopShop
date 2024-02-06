  function setCheck(obj) {
                var fries = document.getElementsByName('manuIdBox');
                if ((obj.id == 'c0') && (fries[0].checked == true)) {
                    for (var i = 1; i < fries.length; i++) {
                        fries[i].checked = false;
                    }
                } else {
                    for (var i = 1; i < fries.length; i++) {
                        if (fries[i].checked == true) {
                            fries[0].checked = false;
                            break;
                        }
                    }
                }
                 var fries = document.getElementsByName('priceBox');
                if ( (obj.id == 'c1') && (fries[0].checked == true)  ){
                    for (var i = 1; i < fries.length; i++) {
                        fries[i].checked = false;
                    }
                } else {
                    for (var i = 1; i < fries.length; i++) {
                        if (fries[i].checked == true) {
                            fries[0].checked = false;
                            break;
                        }
                    }                 
                }
                
                 var fries = document.getElementsByName('cpuBox');
                if ( (obj.id == 'c2') && (fries[0].checked == true)  ){
                    for (var i = 1; i < fries.length; i++) {
                        fries[i].checked = false;
                    }
                } else {
                    for (var i = 1; i < fries.length; i++) {
                        if (fries[i].checked == true) {
                            fries[0].checked = false;
                            break;
                        }
                    }
                }
 
                var fries = document.getElementsByName('ramBox');
                if ( (obj.id == 'c3') && (fries[0].checked == true)  ){
                    for (var i = 1; i < fries.length; i++) {
                        fries[i].checked = false;
                    }
                } else {
                    for (var i = 1; i < fries.length; i++) {
                        if (fries[i].checked == true) {
                            fries[0].checked = false;
                            break;
                        }
                    }
                }
                var fries = document.getElementsByName('ssdBox');
                if ( (obj.id == 'c4') && (fries[0].checked == true)  ){
                    for (var i = 1; i < fries.length; i++) {
                        fries[i].checked = false;
                    }
                } else {
                    for (var i = 1; i < fries.length; i++) {
                        if (fries[i].checked == true) {
                            fries[0].checked = false;
                            break;
                        }
                    }
                }
                var fries = document.getElementsByName('screenBox');
                if ( (obj.id == 'c5') && (fries[0].checked == true)  ){
                    for (var i = 1; i < fries.length; i++) {
                        fries[i].checked = false;
                    }
                } else {
                    for (var i = 1; i < fries.length; i++) {
                        if (fries[i].checked == true) {
                            fries[0].checked = false;
                            break;
                        }
                    }
                }
                document.getElementById('checkbox').submit();
  }
            
      