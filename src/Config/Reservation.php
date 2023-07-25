<?php

namespace App\Config;

class Reservation extends Config{
    private string $name;
    private array $rules;

    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    public function getReservationRules()
    {
        return $this->rules;
    }

    public function setReservationRules($rules)
    {
        $this->rules = $rules;

        return $this;
    }
}

class ReservationRule extends Reservation{
    private array $days;
    private array $places;
    private array $seasons;

    public function getDays()
    {
        return $this->days;
    }

    public function setDays($days)
    {
        $this->days = $days;

        return $this;
    }

    public function getRulePlaces()
    {
        return $this->places;
    }

    public function setRulePlaces($places)
    {
        $this->places = $places;

        return $this;
    }

    public function getRuleSeasons()
    {
        return $this->seasons;
    }

    public function setRuleSeasons($seasons)
    {
        $this->seasons = $seasons;

        return $this;
    }
}