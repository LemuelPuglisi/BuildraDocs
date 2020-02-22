<?php 
    
    # db params 
    $user = ""; 
    $pass = ""; 
    $dbname  = "buildra"; 
    $dbhost  = "localhost"; 
    $errmode = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING); 

    # db connection 
    try {

        $db_conn = new PDO("mysql:host={$dbhost};dbname={$dbname}", $user, $pass, $errmode);
    
    } catch (PDOException $e){
        exit(print $e->getMessage());
    }

    #retrieve xml file 
    $priceListXML = file_get_contents("Prezzario_SR19.xml"); 
    $xml = new SimpleXMLElement($priceListXML); 

    # fetching the whole price list 
    $products = $xml->prezzario; 

    # fetching base units from xml 
    $baseUnits = $xml->prezzario->xpath("//unitaDiMisura");
    
    # indexing all units of measurement 
    $arrayOfBaseUnits = array(); 

    foreach ($baseUnits as $unit) {
        $id   = (int)    $unit['udmId']; 
        $base = (string) $unit['simbolo']; 
        $arrayOfBaseUnits += [$id => $base]; 
    }

    # insert each record into the SQL table
    foreach ($products->prodotto as $product) {

        $baseUnitId = intval($product['unitaDiMisuraId']); 

        $baseUnit = $arrayOfBaseUnits[$baseUnitId] ?? "NONE"; 

        $values = [
            (int) $product['prodottoId'], 
            (string) $product['prdId'], 
            (string) $product->prdDescrizione['breve'], 
            (string) $product->prdDescrizione['estesa'], 
            (string) $baseUnit, 
            (float) $product->prdQuotazione['valore'] ?? 0.0,
            (float) $product->incidenzaManodopera ?? 0.0, 
            2019
        ]; 

        $query = "INSERT INTO service VALUES (?, ?, ?, ?, ?, ?, ?, ?);"; 
    
        $result = $db_conn->prepare($query)->execute($values);     

        if ($result === false) {

            exit(var_dump($values)); 
        }

    }

