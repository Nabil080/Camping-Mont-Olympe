<?php

namespace App\Config;

class Season extends Config{
    private string $name;
    private string $start;
    private string $end;
    private array $days;


    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    public function getStart()
    {
        return $this->start;
    }

    public function setStart($start)
    {
        $this->start = $start;

        return $this;
    }

    public function getEnd()
    {
        return $this->end;
    }

    public function setEnd($end)
    {
        $this->end = $end;

        return $this;
    }

    public function getDays()
    {
        return $this->days;
    }

    public function setDays($days)
    {
        $this->days = $days;

        return $this;
    }
}

class SeasonRule extends Season{
    
}