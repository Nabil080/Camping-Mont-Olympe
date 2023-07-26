<?php

namespace App\Config\Repository;

use App\Config\Season;
use App\Config\Config;
use App\Config\SeasonRule;

class SeasonRepository extends Config{

    public function getSeasons():array
    {
        $data = $this->getData();

        $seasons = [];
        foreach($data['seasons'] as $season){
            $Season = new Season;
            $Season->setId($season['id']);
            $Season->setName($season['name']);
            
            $rules = [];
            foreach($season['rules'] as $rule){
                $Rule = new SeasonRule;
                $Rule->setId($rule['id']);
                $Rule->setStart($rule['start']);
                $Rule->setEnd($rule['end']);
                $Rule->setDays($rule['days']);

                $rules[] = $Rule;
            }

            $Season->setSeasonRules($rules);
            $seasons[$Season->getName()] = $Season;
        }
        

        return $seasons;
    }

    public function getSeasonByName(string $name):Season|bool
    {
        $seasons = $this->getSeasons();

        foreach($seasons as $season)
            if($this->titleToJson($season->getName()) === $this->titleToJson($name))


                return $season;

        return false;
    }


    public function getSeasonById(int $id):Season|bool
    {
        $seasons = $this->getSeasons();

        foreach($seasons as $season)
            if($season->getId() === $id)


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
        $newJson = json_encode($initialData, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK);
        fwrite($file, $newJson);
    }
}