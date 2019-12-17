function customerOrder()
{
    var name = prompt("Please Enter Your Name:");

    while(true)
    {
        var dob = prompt("Please Enter You DOB (YYYY-MM-DD):");
        dob = formatDate(dob)

        if(dob !== 'INVALID DATE')
        {
            window.alert(dob);
            break;
        }
        window.alert(dob);
    }

    var dataArray = [];
    dataArray[0] = name;
    dataArray[1] = dob;

    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        if([year, month, day].join('-') === 'NaN-NaN-NaN')
        {
            return "INVALID DATE";
        }
        else
        {
            return [year, month, day].join('-');
        }

    }

    $.post('processOrder.php',
        {
            name: name,
            dob: dob
        },
        function(data, status){
            alert("Name: " + name + "\nStatus" + status);
        }
    )
}

