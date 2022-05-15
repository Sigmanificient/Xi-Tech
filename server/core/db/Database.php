<?php

namespace Xi\core\db;

use Xi\core\base\Singleton;
use PDO;
use PDOStatement;


/**
 * Database class
 * - Handles database connection
 */
class Database extends Singleton
{
  private PDO $_conn;
    private array $queries = [
        // Generated queries
    ];

  protected function __construct()
  {
    Dotenv::load(ROOT_PATH . '/.env');
    $this->createConnection();
  }

  /**
   * @return void
   * - Creates a new database connection
   */
  private function createConnection()
  {
    $this->_conn = new PDO(
        'mysql:host=' . getenv('DB_HOST')
        . ';dbname=' . getenv('DB_NAME') . ';charset=utf8',
        getenv('DB_USER'), getenv('DB_PASSWORD')
    );

    $this->_conn->setAttribute(
        PDO::ATTR_ERRMODE,
        PDO::ERRMODE_EXCEPTION
    );
  }

  public function execute($query_label, $params = []): PDOStatement
  {
    $stmt = $this->_conn->prepare($this->queries[$query_label]);
    $stmt->execute($params);
    return $stmt;
  }
}
