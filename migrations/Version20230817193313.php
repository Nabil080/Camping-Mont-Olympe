<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230817193313 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE location (id INT NOT NULL, accomodation_id INT NOT NULL, available TINYINT(1) NOT NULL, INDEX IDX_5E9E89CBFD70509C (accomodation_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE location ADD CONSTRAINT FK_5E9E89CBFD70509C FOREIGN KEY (accomodation_id) REFERENCES accomodation (id)');
        $this->addSql('ALTER TABLE spot DROP FOREIGN KEY FK_B9327A73FD70509C');
        $this->addSql('DROP TABLE spot');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE spot (id INT NOT NULL, accomodation_id INT NOT NULL, available TINYINT(1) NOT NULL, INDEX IDX_B9327A73FD70509C (accomodation_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb3 COLLATE `utf8mb3_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE spot ADD CONSTRAINT FK_B9327A73FD70509C FOREIGN KEY (accomodation_id) REFERENCES accomodation (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE location DROP FOREIGN KEY FK_5E9E89CBFD70509C');
        $this->addSql('DROP TABLE location');
    }
}
