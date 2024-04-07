<!DOCTYPE html>
<html>
<head>
    <title>SMS ADB</title>
    <link rel="stylesheet" href="css/main.css">
    <script src="js/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            function refreshSMS() {
                $.ajax({
                    url: "sms_adb.php",
                    type: "GET",
                    success: function(data) {
                        $("#sms_table").html(data);
                    }
                });
            }

            setInterval(refreshSMS, 1000);
        });
    </script>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 py-2">
                <div class="card">
                    <div class="card-header">
                        <h3><b>SMS ADB</b></h3>
                    </div>
                    <div class="limiter">
                        <div class="container-table100">
                            <table>
                                <thead> 
                                    <tr>
                                        <th class="column1">Waktu</th>
                                        <th class="column2">Dari</th>
                                        <th class="column3">Pesan</th>
                                    </tr>
                                </thead>
                                <tbody id="sms_table"> 
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
