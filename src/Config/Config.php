<?php

namespace App\Config;

class Config {

    public function getJson(){
        $json = file_get_contents("config.json");

        return $json;
    }

    public function getData(bool $asArray = true):array
    {
        return json_decode($this->getJSon(),$asArray);
    }

    public function getRules(bool $asArray = true):array
    {
        return $this->getData($asArray)['rules'];
    }

    public function openJson(){
        return fopen("config.json",'w');
    }

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
        $newJson = json_encode($newData,JSON_PRETTY_PRINT);
        fwrite($file, $newJson);
    }

    public function getSeasons():array
    {
        $data = $this->getRules();
        $seasons = [];
        foreach($data['seasons'] as $SeasonName => $SeasonRules)
            foreach($SeasonRules as $rule){
                $season = new Season;
                $season->setName($SeasonName);
                $season->setStart($rule['start']);
                $season->setEnd($rule['end']);
                $season->setDays($rule['days']);

                $seasons[] = $season;
            }

        return $seasons;
    }

}