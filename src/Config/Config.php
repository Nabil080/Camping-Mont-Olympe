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
        $newJson = json_encode($newData,JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK);
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
        $newJson = json_encode($initialData, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK);
        fwrite($file, $newJson);
    }

    public function updateSeason(string $oldname,Season $season){
        $initialData = $this->getData();

        unset($initialData['rules']['seasons'][$oldname]);
        $initialData['rules']['seasons'][$season->getName()] = [];

        foreach($season->getSeasonRules() as $seasonRule)
            $initialData['rules']['seasons'][$season->getName()][] = $seasonRule->seasonRuleToJson();
        
        $file = $this->openJson();
        $newJson = json_encode($initialData, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK);
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
        $newJson = json_encode($initialData, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK);
        fwrite($file, $newJson);
    }

    public function create(){


        $config = [
            "camping" => [],
            "seasons" => [],
            "reservations" => [],
            "prices" => [],
            "services" => [],
            "paiement" => [],
            "taxes" => []
        ];

        $config["camping"] = [
            "name" => "Camping Mont-Olympe",
            "adress" => "139 rue des Pâquis, 08000 Charleville-Mézières",
            "phone" => "+33 3 24 33 23 60",
            "website" => "www.camping-mont-olympe.fr",
            "email" => "contact@camping-mont-olympe.fr"
        ];

        $config["seasons"] = [
            "Saison 1" => [
                "id" => 1,
                "name" => "Saison 1",
                "rules" => [
                    [
                        "id" => 1,
                        "start" => "2023-01-01",
                        "end" => "2023-06-30",
                        "days" => [1,2,3,4,5]
                    ],
                    [
                        "id" => 2,
                        "start" => "2023-09-01",
                        "end" => "2023-09-15",
                        "days" => ["All"]
                    ]
                ]
            ],
            "Saison 2" => [
                "id" => 2,
                "name" => "Saison 2",
                "rules" => [
                    [
                        "id" => 1,
                        "start" => "2023-07-01",
                        "end" => "2023-08-31",
                        "days" => ["All"]
                    ],
                    [
                        "id" => 2,
                        "start" => "2023-09-16",
                        "end" => "2023-09-24",
                        "days" => ["All"]
                    ]
                ]
            ],
        ];

        $config["reservations"] = [
            "check-in" => [],
            "check-out" => [],
            "min-stay" => [],
            "max-stay" => [],
            "emplacement" => [],
        ];

        $config["reservations"]["check-in"] = [
            "id" => 1,
            "name" => "check-in",
            "rules" => [
                [
                    "id" => 1,
                    "days" => [],
                    "places" => []
                ],
                [
                    "id" => 2,
                    "days" => [],
                    "places" => []
                ]
            ]
        ];

        $config["reservations"]["check-out"] = [
            "id" => 2,
            "name" => "check-out",
            "rules" => [
                [
                    "id" => 1,
                    "days" => [],
                    "places" => []
                ]
            ]
        ];


        $config["reservations"]["min-stay"] = [
            "id" => 3,
            "name" => "min-stay",
            "rules" => [
                [
                    "id" => 1,
                    "places" => [],
                    "seasons" => []
                ]
            ]
        ];

        $config["reservations"]["max-stay"] = [
            "id" => 4,
            "name" => "max-stay",
            "rules" => [
                [
                    "id" => 1,
                    "places" => [],
                    "seasons" => []
                ]
            ]
        ];

        $config["reservations"]["emplacement"] = [
            "id" => 5,
            "name" => "emplacement",
            "rules" => [
                [
                    "id" => 1,
                    "canChoose" => false,
                    "places" => []
                ]
            ]
        ];

        $config["prices"] = [
            "places" => [],
            "services" => [],
            "age" => [],
            "offers" => []
        ];

        // todo: fetch db pour mettre les emplacements auto
        $config["prices"]["places"] = [
            "Hébergement 1" => [
                "id" => 1,
                "name" => "Hébergement 1",
                "rules" => [
                    [
                        "id" => 1,
                        "amount" => 0,
                        "per_days" => true,
                        "per_person" => false,
                        "seasons" => []
                    ]
                ]
            ]
        ];
        
        // todo: fetch db pour mettre les services auto
        $config["prices"]["services"] = [
            "Service 1" => [
                "id" => 1,
                "name" => "Service 1",
                "rules" => [
                    [
                        "id" => 1,
                        "amount" => 0,
                        "per_days" => false,
                        "per_person" => false,
                        "seasons" => []
                    ]
                ]
            ]
        ];

        $config["prices"]["age"] = [
            "adult" => [
                "id" => 1,
                "name" => "adult",
                "rules" => [
                    [
                        "id" => 1,
                        "amount" => 0,
                        "per_days" => true,
                        "per_person" => true,
                        "seasons" => []
                    ]
                ]
            ],
            "children" => [
                "id" => 2,
                "name" => "children",
                "rules" => [
                    [
                        "id" => 1,
                        "amount" => 0,
                        "per_days" => true,
                        "per_person" => true,
                        "seasons" => []
                    ]
                ]
            ]
        ];

        $config["prices"]["offers"] = [
            "coupons" => [
                "id" => 1,
                "name" => "coupons",
                "rules" => [
                    [
                        "id" => 1,
                        "name" => "REMISE08",
                        "amount" => 0,
                        "type" => "devise",
                        "uses" => 20,
                        "start" => "2023-01-01",
                        "end" => false,
                        "places" => []
                    ]
                ]
            ],
            "discounts" => [
                "id" => 2,
                "name" => "discounts",
                "rules" => [
                    [
                        "id" => 1,
                        "name" => "solde de noel",
                        "amount" => 0.2,
                        "type" => "percentage",
                        "uses" => false,
                        "start" => "2023-12-01",
                        "end" => "2024-01-01",
                        "places" => []
                    ]
                ],
            ]
        ];

        $config["services"] = [
            "Service 1" => [
                "id" => 1,
                "name" => "Service 1",
                "rules" => [
                    [
                        "id" => 1,
                        "max" => 0,
                        "places" => []
                    ]
                ]
            ],
            "Service 2" => [
                "id" => 2,
                "name" => "Service 2",
                "rules" => [
                    [
                        "id" => 1,
                        "max" => 6,
                        "places" => []
                    ]
                ]
            ]
        ];

        $config["paiement"] = [
            "cash" => true,
            "card" => true,
            "paypal" => true,
            "check" => true,
            "holiday_check" => true
        ];

        $config["taxes"] = [
            "TVA" => [
                "id" => 1,
                "name" => "TVA",
                "amount" => 0.20,
                "type" => "percentage",
                "per_days" => false,
                "per_person" => false,
            ],
            "taxe de séjour" => [
                "id" => 2,
                "name" => "taxe de séjour",
                "amount" => "0.22",
                "type" => "devise",
                "per_days" => true,
                "per_person" => true
            ]
        ];


        $file = $this->openJson();
        $newJson = json_encode($config, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK);
        fwrite($file, $newJson);
    }

    public function deleteSeason(Season $season)
    {
        $initialData = $this->getData();

        unset($initialData['rules']['seasons'][$season->getName()]);

        $file = $this->openJson();
        $newJson = json_encode($initialData, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK);
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
        $newJson = json_encode($initialData, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK);
        fwrite($file, $newJson);
    }


}