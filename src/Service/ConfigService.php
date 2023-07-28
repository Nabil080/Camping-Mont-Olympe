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

    public function getPricesRules(string $type): array
    {
        $config = $this->getConfigData();
        return $config['prices'][$type] ?? [];
    }

    public function addPriceRule(string $type, array $rule): void
    {
        $config = $this->getConfigData();
        $config['prices'][$type][] = $rule;
        $this->saveConfigData($config);
    }

    public function updatePriceRule(string $type, int $ruleIndex, array $rule): void
    {
        $config = $this->getConfigData();
        $config['prices'][$type][$ruleIndex] = $rule;
        $this->saveConfigData($config);
    }

    public function deletePriceRule(string $type, int $ruleIndex): void
    {
        $config = $this->getConfigData();
        unset($config['prices'][$type][$ruleIndex]);
        $this->saveConfigData($config);
    }
}
