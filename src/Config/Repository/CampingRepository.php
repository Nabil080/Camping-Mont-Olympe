<?php

namespace App\Config\Repository;

use App\Config\Camping;
use App\Config\Config;

class CampingRepository extends Config{
    public function getCamping():Camping
    {
        $data = $this->getData();

        $camping = new Camping;
        $camping->setName($data['camping']['name']);
        $camping->setAdress($data['camping']['adress']);
        $camping->setPhone($data['camping']['phone']);
        $camping->setWebsite($data['camping']['website']);
        $camping->setEmail($data['camping']['email']);


        return $camping;
    }

    public function setCamping(Camping $camping):void
    {
        $initialData = $this->getData();
        $newData = $initialData;

        $newData['camping'] = [
            "name" => $camping->getName(),
            "adress" => $camping->getAdress(),
            "phone" => $camping->getPhone(),
            "website" => $camping->getWebsite(),
            "email" => $camping->getEmail()
        ];

        $file = $this->openJson();
        $newJson = json_encode($newData,JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK);
        fwrite($file, $newJson);
    }
}