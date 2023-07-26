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
}