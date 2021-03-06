<!--Test Oracle file for UBC CPSC304 2018 Winter Term 1
  Created by Jiemin Zhang
  Modified by Simona Radu
  Modified by Jessica Wong (2018-06-22)
  This file shows the very basics of how to execute PHP commands
  on Oracle.  
  Specifically, it will drop a table, create a table, insert values
  update values, and then query for values
 
  IF YOU HAVE A TABLE CALLED "demoTable" IT WILL BE DESTROYED

  The script assumes you already have a server set up
  All OCI commands are commands to the Oracle libraries
  To get the file to work, you must place it somewhere where your
  Apache server can run it, and you must rename it to have a ".php"
  extension.  You must also change the username and password on the 
  OCILogon below to be your ORACLE username and password -->

  <html>
    <head>
        <title>CPSC 304 PHP/Oracle Demonstration</title>
    </head>



    <body>
        <h2>Insert Values into Supplier Table</h2>
        <form method="POST" action="restaurant.php"> <!--refresh page when submitted-->
            <input type="hidden" id="insertQueryRequest" name="insertQueryRequest">
            Supplier ID: <input type="text" name="insNo"> <br /><br />
            Name: <input type="text" name="insName"> <br /><br />

            <input type="submit" value="Insert" name="insertSubmit"></p>
        </form>

    <hr />

    <h2>Delete entries from givesOrderOrder Tables</h2>
        <p>The values are case sensitive and if you enter in the wrong case, the delete statement will not do anything.</p>

        <form method="POST" action="restaurant.php">
            <input type="hidden" id="deleteQueryRequest" name="deleteQueryRequest">
            Order No.: <input type="text" name="oNo"> <br /><br />

            <input type="submit" value="Delete" name="deleteSubmit"></p>
        </form>

    <hr />

    <h2>Update Price in Sells Table</h2>

        <form method="POST" action="restaurant.php"> <!--refresh page when submitted-->
            <input type="hidden" id="updateQueryRequest" name="updateQueryRequest">
            Supplier ID: <input type="text" name="id"> <br /><br />
            Ingredient Name: <input type="text" name="iName"> <br /><br />
            <!-- New Price: <input type="number" step="0.01" name="price"> <br /><br /> -->
            New Price: <input type="text" name="newPrice"> <br /><br />

            <input type="submit" value="Update" name="updateSubmit"></p>
        </form>

    <hr />


    <h2>Join: find manager name given restaurant branch number</h2>

        <form method="POST" action="restaurant.php"> <!--refresh page when submitted-->
            <input type="hidden" id="joinQueryRequest" name="joinQueryRequest">
            branch number: <input type="text" name="bno"> <br /><br />

            <input type="submit" value="Join" name="joinSubmit"></p>
        </form>

    <hr />


    <h2>Project</h2>

        <form method="POST" action="restaurant.php"> <!--refresh page when submitted-->
            <input type="hidden" id="projectQueryRequest" name="projectQueryRequest">
            project on:  <select name="projection">
                        <option value="">Select...</option>
                        <option value="cname">Customer Name</option>
                        <option value="tableNum">Table number</option>
                        <option value="startTime">Start time</option>
                        <option value="groupSize">Group Size</option>
                        <option value="phoneNum">Phone number</option>
                        </select>
            <input type="submit" value="Project" name="projectSubmit"></p>
        </form>

    <hr />


    <h2>Aggregation with GROUP BY</h2>
        <form method="POST" action="restaurant.php"> <!--refresh page when submitted-->
            <input type="hidden" id="groupByQueryRequest" name="groupByQueryRequest">
            <p>find the  <select name="groupBy">
                        <option value="">Select...</option>
                        <option value="MAX">highest</option>
                        <option value="MIN">lowest</option>
                        <option value="AVG">average</option>
                        </select>
            salary of chef for each years of cooking experience</p>
            <input type="submit" value="GroupBy" name="groupBySubmit"></p>
        </form>

    <hr />

 


        <?php
		//this tells the system that it's no longer just parsing html; it's now parsing PHP

        $success = True; //keep track of errors so it redirects the page only if there are no errors
        $db_conn = NULL; // edit the login credentials in connectToDB()
        $show_debug_alert_messages = False; // set to True if you want alerts to show you which methods are being triggered (see how it is used in debugAlertMessage())

        function debugAlertMessage($message) {
            global $show_debug_alert_messages;

            if ($show_debug_alert_messages) {
                echo "<script type='text/javascript'>alert('" . $message . "');</script>";
            }
        }

        function executePlainSQL($cmdstr) { //takes a plain (no bound variables) SQL command and executes it
            //echo "<br>running ".$cmdstr."<br>";
            global $db_conn, $success;

            $statement = OCIParse($db_conn, $cmdstr); 
            //There are a set of comments at the end of the file that describe some of the OCI specific functions and how they work

            if (!$statement) {
                echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
                $e = OCI_Error($db_conn); // For OCIParse errors pass the connection handle
                echo htmlentities($e['message']);
                $success = False;
            }

            $r = OCIExecute($statement, OCI_DEFAULT);
            if (!$r) {
                echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
                $e = oci_error($statement); // For OCIExecute errors pass the statementhandle
                echo htmlentities($e['message']);
                $success = False;
            }

			return $statement;
		}

        function executeBoundSQL($cmdstr, $list) {
            /* Sometimes the same statement will be executed several times with 
        different values for the variables involved in the query.
		In this case you don't need to create the statement several times. Bound 
        variables cause a statement to only be
		parsed once and you can reuse the statement. This is also very useful in 
        protecting against SQL injection. 
		See the sample code below for how this function is used */

			global $db_conn, $success;
			$statement = OCIParse($db_conn, $cmdstr);

            if (!$statement) {
                echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
                $e = OCI_Error($db_conn);
                echo htmlentities($e['message']);
                $success = False;
            }

            foreach ($list as $tuple) {
                foreach ($tuple as $bind => $val) {
                    //echo $val;
                    //echo "<br>".$bind."<br>";
                    OCIBindByName($statement, $bind, $val);
                    unset ($val); //make sure you do not remove this. Otherwise $val will remain in an array object wrapper which will not be recognized by Oracle as a proper datatype
				}

                $r = OCIExecute($statement, OCI_DEFAULT);
                if (!$r) {
                    echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
                    $e = OCI_Error($statement); // For OCIExecute errors, pass the statementhandle
                    echo htmlentities($e['message']);
                    echo "<br>";
                    $success = False;
                }
            }
        }



        function connectToDB() {
            global $db_conn;

            // Your username is ora_(CWL_ID) and the password is a(student number). For example, 
			// ora_platypus is the username and a12345678 is the password.
            $db_conn = OCILogon("ora_x", "ax", "dbhost.students.cs.ubc.ca:1522/stu");

            if ($db_conn) {
                debugAlertMessage("Database is Connected");
                return true;
            } else {
                debugAlertMessage("Cannot connect to Database");
                $e = OCI_Error(); // For OCILogon errors pass no handle
                echo htmlentities($e['message']);
                return false;
            }
        }

        function disconnectFromDB() {
            global $db_conn;

            debugAlertMessage("Disconnect from Database");
            OCILogoff($db_conn);
        }



        function handleInsertRequest() {
            global $db_conn;

            //Getting the values from user and insert data into the table
            $tuple = array (
                // ":bind1" => $_POST['insNo'],
                // ":bind2" => $_POST['insName']
                $b1 = $_POST['insNo'],
                $b2 = $_POST['insName']
            );

            $alltuples = array (
                $tuple
            );

            executeBoundSQL("insert into Supplier values ('$b1', '$b2')", $alltuples);
            OCICommit($db_conn);
        }

        function handleDeleteRequest() {
            global $db_conn;

            $res = $_POST["oNo"];
    

            // you need the wrap the old name and new name values with single quotations
            $result = executePlainSQL("DELETE FROM givesOrderOrder WHERE orderNum = '$res'");
            OCICommit($db_conn);
        }

        function handleUpdateRequest() {
            global $db_conn;

            $res1 = $_POST['id'];
            $res2 = $_POST['iName'];
            $res3 = $_POST['newPrice'];
            $res3 = (float) $res3;

            executePlainSQL("UPDATE Sells SET price = $res3 WHERE sid = $res1 AND ingredName = '$res2'");
            OCICommit($db_conn);
        }

        function printResult($result) { 
            echo "<table>";
            echo "<tr><th>manager name</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            echo "</table>";
        }


        function handleJoinRequest() {
            global $db_conn;

            $res = $_POST['bno'];
            $res = intval($res);

            $result = executePlainSQL("SELECT mname FROM Manager m, hasRestaurant hr WHERE m.empNum = hr.empNum AND branchNum= $res");
            printResult($result);
            OCICommit($db_conn);
        }

        function handleProjectRequest() {
            global $db_conn;

            $res = $_POST['projection'];

            $result = executePlainSQL("SELECT $res FROM Customer");
            printResult($result);
        }


        function printGroupByResult($result) { //prints results from a select statement
            echo "<br>Retrieved data from table demoTable:<br>";
            echo "<table>";
            echo "<tr><th>ID</th><th>Name</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td></tr>"; //or just use "echo $row[0]" 
            }

            echo "</table>";
        }


        function handleGroupByRequest() {
            global $db_conn;

            $res = $_POST['groupBy'];
            // $res .= "(salary)";
            echo $res;

            $result = executePlainSQL("SELECT YearsOfExp, '$res' FROM Chef GROUP BY yearsOfExp");
            printGroupByResult($result);
        }






        // HANDLE ALL POST ROUTES
	// A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
        function handlePOSTRequest() {
            if (connectToDB()) {
                if (array_key_exists('insertQueryRequest', $_POST)) {
                    handleInsertRequest();
                } else if (array_key_exists('deleteQueryRequest', $_POST)) {
                    handleDeleteRequest();
                } else if (array_key_exists('updateQueryRequest', $_POST)) {
                    handleUpdateRequest();
                } else if (array_key_exists('joinQueryRequest', $_POST)) {
                    handleJoinRequest();
                } else if (array_key_exists('projectQueryRequest', $_POST)) {
                    handleProjectRequest();
                } else if (array_key_exists('groupByQueryRequest', $_POST)) {
                    handleGroupByRequest();
                } 

                disconnectFromDB();
            }
        }



		if (isset($_POST['insertSubmit']) || isset($_POST['deleteSubmit']) || isset($_POST['updateSubmit'])
            || isset($_POST['joinSubmit']) || isset($_POST['projectSubmit']) || isset($_POST['groupBySubmit'])) {
            handlePOSTRequest();
        } 
		?>
	</body>
</html>




