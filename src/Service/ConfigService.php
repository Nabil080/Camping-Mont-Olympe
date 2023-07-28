<?php

namespace App\Service;

class ConfigService
{
    private string $configFilePath;

    public function __construct(string $configFilePath = null)
    {
        if($configFilePath === null) $configFilePath = "config.json";
        $this->configFilePath = $configFilePath;
    }

    private function getConfigData(): array
    {
        $json = file_get_contents($this->configFilePath);
        return json_decode($json, true);
    }

    private function saveConfigData(array $data): void
    {
        $newJson = json_encode($data, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK);
        file_put_contents($this->configFilePath, $newJson);
    }

    public function getPricesRules(string $type = null): array
    {
        $config = $this->getConfigData();

        if($type === null) return $config['prices'];

        return $config['prices'][$type] ?? [];
    }

    public function getLastPricesRules(string $type):int
    {
        $lastId = $this->getPricesRules($type);
        $lastId = end($lastId);
        
        return $lastId['id'];
    }

    public function addPriceRule(string $type, int $typeId, array $rule): void
    {
        $config = $this->getConfigData();
        $config['prices'][$type][$typeId]['rules'][] = $rule;
        $this->saveConfigData($config);
    }

    public function updatePriceRule(string $type, int $typeId, array $rule): void
    {
        $config = $this->getConfigData();
        $config['prices'][$type][$typeId]['rules'][$rule['id']] = $rule;
        $this->saveConfigData($config);
    }

    public function deletePriceRule(string $type, int $id, int $ruleId): void
    {
        $config = $this->getConfigData();
        foreach($config['prices'][$type][$id]['rules'] as $index => $rule);
            if($rule['id'] === $ruleId)
                unset($config['prices'][$type][$id]['rules'][$index]);

        $this->saveConfigData($config);
    }


    // SEASONS

    public function getConfigByName(string $name = null): array
    {
        $config = $this->getConfigData();

        if($name === null) return $config;

        return $config[$name] ?? [];
    }
}
