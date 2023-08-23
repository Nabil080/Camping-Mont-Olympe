<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230823215413 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE accomodation_tag (accomodation_id INT NOT NULL, tag_id INT NOT NULL, INDEX IDX_9119702FFD70509C (accomodation_id), INDEX IDX_9119702FBAD26311 (tag_id), PRIMARY KEY(accomodation_id, tag_id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE accomodation_tag ADD CONSTRAINT FK_9119702FFD70509C FOREIGN KEY (accomodation_id) REFERENCES accomodation (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE accomodation_tag ADD CONSTRAINT FK_9119702FBAD26311 FOREIGN KEY (tag_id) REFERENCES tag (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE tag DROP FOREIGN KEY FK_389B783FD70509C');
        $this->addSql('DROP INDEX IDX_389B783FD70509C ON tag');
        $this->addSql('ALTER TABLE tag DROP accomodation_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE accomodation_tag DROP FOREIGN KEY FK_9119702FFD70509C');
        $this->addSql('ALTER TABLE accomodation_tag DROP FOREIGN KEY FK_9119702FBAD26311');
        $this->addSql('DROP TABLE accomodation_tag');
        $this->addSql('ALTER TABLE tag ADD accomodation_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE tag ADD CONSTRAINT FK_389B783FD70509C FOREIGN KEY (accomodation_id) REFERENCES accomodation (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_389B783FD70509C ON tag (accomodation_id)');
    }
}
