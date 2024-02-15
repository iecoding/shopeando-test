<?php 

/**
 * Conexión a la base de datos
 */
    $host       = 'localhost';
    $dbname     = 'pruebashopeando';
    $db_user       = 'root';
    $password   = '';

    try {
        $pdo = new PDO('mysql:host=localhost;dbname=pruebashopeando', $db_user, $password);
        $pdo->query('SELECT * FROM pruebashopeando.posts');
    } catch (PDOException $e) {
        print "¡Error!: " . $e->getMessage() . "<br/>";
        die();
    }

/**
 * Endpoints
 */


    // POST /posts (Crea una nueva publicación en la base de datos)
    if ($_SERVER["REQUEST_METHOD"] === 'POST' && $_SERVER["REQUEST_URI"] === '/api/posts') {
        $rawData = file_get_contents("php://input");
        $putData = json_decode($rawData, true);
    
        $title = isset($putData['title']) ? $putData['title'] : null;
        $content = isset($putData['content']) ? $putData['content'] : null;
    
        if (!$title && !$content) {
            http_response_code(400);
            echo json_encode(['error' => 'Se requiere al menos un título o contenido']);
            exit;
        }
        $creation_date  = date("Y-m-d H:i:s"); 

        // prepare and bind
        $stmt = $pdo->prepare("INSERT INTO posts (title, content, created_at) VALUES (?, ?, ?)");
        $stmt->execute([$title, $content, $creation_date]);
        $postId = $pdo->lastInsertId();

        header('Content-Type: application/json');
        echo json_encode([
            'id'            => $postId,
            'title'         => $title,
            'content'       => $content,
            'created_at'    => $creation_date
        ]);
        exit;

    }
    
    // GET /posts (Devuelve todas las publicaciones en la base de datos)
    if ($_SERVER["REQUEST_METHOD"] === 'GET' && $_SERVER["REQUEST_URI"] === '/api/posts' ) {
        $stmt = $pdo->query('SELECT * FROM posts ORDER BY created_at DESC');
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);     
        //print_r($result);
        header('Content-Type: application/json');
        echo json_encode($result);
        exit;
    }

    // **GET /posts/{id}**:
    if ($_SERVER["REQUEST_METHOD"] === 'GET' && preg_match('/^\/api\/posts\/(\d+)$/', $_SERVER['REQUEST_URI'], $matches)) {
        $postId = $matches[1];

        $comments = fetchJSONPlaceholder($postId);

        $stmt = $pdo->prepare("SELECT * FROM posts WHERE id = ?");
        $stmt->execute([$postId]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $result['comments'] = $comments;

        
        header('Content-Type: application/json');
        echo json_encode($result);
        exit;
    }

    // **PUT /posts/{id}**:
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && preg_match('/^\/api\/posts\/(\d+)$/', $_SERVER['REQUEST_URI'], $matches)) {
        $postId = $matches[1];
    
        $rawData = file_get_contents("php://input");
        $putData = json_decode($rawData, true);
    
        $title = isset($putData['inputTitle']) ? $putData['inputTitle'] : null;
        $content = isset($putData['inputContent']) ? $putData['inputContent'] : null;
    
        if (!$title && !$content) {
            http_response_code(400);
            echo json_encode(['error' => 'Se requiere al menos un título o contenido']);
            exit;
        }
    
        $stmt = $pdo->prepare("UPDATE posts SET title = ?, content = ? WHERE id = ?");
        $stmt->execute([$title, $content, $postId]);
    
        if ($stmt->rowCount() === 0) {
            http_response_code(404);
            echo json_encode(['error' => 'No se encontró la publicación con la ID especificada']);
            exit;
        }
    
        header('Content-Type: application/json');
        echo json_encode(['message' => 'Publicación actualizada']);
        exit;
    }
    
    // Endpoint para eliminar una publicación
    if ($_SERVER['REQUEST_METHOD'] === 'DELETE' && preg_match('/^\/posts\/(\d+)$/', $_SERVER['REQUEST_URI'], $matches)) {
        $postId = $matches[1];
    
        $stmt = $pdo->prepare("DELETE FROM posts WHERE id = ?");
        $stmt->execute([$postId]);
    
        if ($stmt->rowCount() === 0) {
            http_response_code(404);
            echo json_encode(['error' => 'Publicación no encontrada']);
            exit;
        }
    
        header('Content-Type: application/json');
        echo json_encode(['message' => 'Publicación eliminada']);
        exit;
    }

    // Endpoint para obtener los comentarios asociados a una publicación
    if ($_SERVER['REQUEST_METHOD'] === 'GET' && preg_match('/^\/api\/posts\/(\d+)\/comments$/', $_SERVER['REQUEST_URI'], $matches)) {
        $postId = $matches[1];

        $comments = fetchJSONPlaceholder($postId);

        $stmt = $pdo->prepare("SELECT * FROM comments WHERE postId = ?");
        $stmt->execute([$postId]);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $result['comments'] = $comments;

        header('Content-Type: application/json');
        echo json_encode($result);
        exit;
    }
    
    // Si ninguna de las rutas coincide, devolver un error 404
    http_response_code(404);
    echo json_encode(['error' => 'Ruta no encontrada']);

    function fetchJSONPlaceholder($postId) {
        
            // Obtener los comentarios asociados a la publicación
            $commentsData = @file_get_contents("https://jsonplaceholder.typicode.com/comments?postId=$postId");
            $comments = json_decode($commentsData, true);

            // Obtener la lista de fotos de la API de JSONPlaceholder
            $photosData = @file_get_contents("https://jsonplaceholder.typicode.com/photos");
            $photos = json_decode($photosData, true);

            // Si la API falla entonces avisar
            if ($commentsData === false || $photosData  === false) {
                http_response_code(500);
                echo json_encode(['error' => 'Error al interactuar con la API JSONPlaceholder.']);
                exit;
            }
        
        // Asociar los comentarios a las publicaciones en tu aplicación
        foreach ($comments as &$comment) {
            // Seleccionar una foto de manera aleatoria de la lista de fotos
            $randomPhotoIndex = array_rand($photos);
            $randomPhoto = $photos[$randomPhotoIndex];
            $comment['photo'] = $randomPhoto['thumbnailUrl'];
        }

        return $comments;
    }