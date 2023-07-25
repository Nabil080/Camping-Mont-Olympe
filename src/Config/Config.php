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

    public function titleToJson(string $string):string
    {
        return strtolower(str_replace(" ", "_",$string));
    }

    public function JsonToTitle(string $string):string
    {
        return ucwords(str_replace("_"," ",$string));
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
        foreach($data['seasons'] as $SeasonName => $SeasonRules){
            $season = new Season;
            $season->setName($SeasonName);
            $rules = [];

            foreach($SeasonRules as $rule){
                $seasonRule = new SeasonRule;
                $seasonRule->setStart($rule['start']);
                $seasonRule->setEnd($rule['end']);
                $seasonRule->setDays($rule['days']);

                $rules[] = $seasonRule;
            }

            $season->setSeasonRules($rules);
            $seasons[] = $season;
        }

        return $seasons;
    }

    public function getSeasonByName(string $name):Season|bool
    {
        $seasons = $this->getSeasons();

        foreach($seasons as $season)
            if($season->getName() === $this->titleToJson($name))


                return $season;

        return false;
    }

    public function addSeason(Season $season){
        $initialData = $this->getData();

        if($this->getSeasonByName($season->getName()) === false)
            $initialData['rules']['seasons'][$season->getName()] = [];
        

        foreach($season->getSeasonRules() as $seasonRule)
            $initialData['rules']['seasons'][$season->getName()][] = $seasonRule->seasonRuleToJson();
        

        $file = $this->openJson();
        $newJson = json_encode($initialData, JSON_PRETTY_PRINT);
        fwrite($file, $newJson);
    }

    public function updateSeason(string $oldname,Season $season){
        $initialData = $this->getData();

        unset($initialData['rules']['seasons'][$oldname]);
        $initialData['rules']['seasons'][$season->getName()] = [];

        foreach($season->getSeasonRules() as $seasonRule)
            $initialData['rules']['seasons'][$season->getName()][] = $seasonRule->seasonRuleToJson();
        
        $file = $this->openJson();
        $newJson = json_encode($initialData, JSON_PRETTY_PRINT);
        fwrite($file, $newJson);
    }

    public function deleteSeasonRule(Season $season, SeasonRule $seasonRule)
    {
        $initialData = $this->getData();
        var_dump($initialData['rules']['seasons']);

        foreach($initialData['rules']['seasons'] as $seasonName => $seasonRules){
            if($seasonName !== $this->titleToJson($season->getName())) continue;

            foreach($seasonRules as $index => $rule){
                if($rule['start'] == $seasonRule->getStart()
                && $rule['end'] == $seasonRule->getEnd()
                && $rule['days'] == $seasonRule->getDays()){
                    unset($initialData['rules']['seasons'][$seasonName][$index]);
                }
            }
        }
        
        $file = $this->openJson();
        $newJson = json_encode($initialData, JSON_PRETTY_PRINT);
        fwrite($file, $newJson);
    }

}