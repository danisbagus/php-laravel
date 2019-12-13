<?php

    function connection(){

        $dbhost = "172.19.0.2";
        $dbuser = "root";
        $dbpass = "1234";
        $dbname = "kampusku";

        return mysqli_connect($dbhost,$dbuser,$dbpass,$dbname);
    }

    function getTableMahasiswa(){

        $link = connection();

        $query = "SELECT * FROM mahasiswa";

        $result = mysqli_query($link,$query);

        $array = mysqli_fetch_all($result,MYSQLI_ASSOC);

        return $array;

    }

