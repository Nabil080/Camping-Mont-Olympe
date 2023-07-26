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
            $seasons[$SeasonName] = $season;
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

    public function deleteSeason(Season $season)
    {
        $initialData = $this->getData();

        unset($initialData['rules']['seasons'][$season->getName()]);

        $file = $this->openJson();
        $newJson = json_encode($initialData, JSON_PRETTY_PRINT);
        fwrite($file, $newJson);
    }

    public function getReservations():array
    {
        $data = $this->getRules();
        $reservations = [];
        foreach($data['reservations'] as $ReservationName => $ReservationRules){
            $reservation = new Reservation;
            $reservation->setName($ReservationName);
            $rules = [];

            foreach($ReservationRules as $rule){
                $ReservationRule = new ReservationRule;

                if($ReservationName === "check-in" || $ReservationName === "check-out"){
                    $ReservationRule->setDays($rule['days']);
                    $ReservationRule->setRulePlaces($rule['places']);
                }

                if($ReservationName === "min-stay" || $ReservationName === "max-stay"){
                    $ReservationRule->setRulePlaces($rule['places']);
                    $ReservationRule->setRuleSeasons($rule['seasons']);
                }

                $rules[] = $ReservationRule;
            }

            $reservation->setReservationRules($rules);
            $reservations[$ReservationName] = $reservation;
        }

        return $reservations;
    }

    public function getReservationByName(string $name):Reservation|bool
    {
        $reservations = $this->getReservations();

        foreach($reservations as $reservation)
            if($reservation->getName() === $this->titleToJson($name))


                return $reservation;

        return false;
    }

    public function updateReservation(string $reservationName, Reservation $reservation)
    {
        $initialData = $this->getData();

        $initialData['rules']['reservations'][$reservationName] = [];

        foreach($reservation->getReservationRules() as $reservationRule)
            // $initialData['rules']['reservations'][$reservationName][] = $seasonRule->seasonRuleToJson();
        
        $file = $this->openJson();
        $newJson = json_encode($initialData, JSON_PRETTY_PRINT);
        fwrite($file, $newJson);
    }


}