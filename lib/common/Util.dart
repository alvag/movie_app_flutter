final String _imageUrlMedium = 'https://image.tmdb.org/t/p/w300';
final String _imageUrlLarge = 'https://image.tmdb.org/t/p/w500';

String getMediumPictureUrl(String path) => _imageUrlMedium + path;
String getLargePictureUrl(String path) => _imageUrlLarge + path;

String getGenres(List<dynamic> genresMovie) {
    StringBuffer buffer = new StringBuffer();
    List<String> genresNames = [];
    genres.forEach((genre) {
        if (genresMovie.contains(genre['id'])) {
            genresNames.add(genre['name']);
        }
    } );
    buffer.writeAll(genresNames, ', ');
    return buffer.toString();
}

const List<Map<String, dynamic>> genres = [
        {
            "id": 28,
            "name": "Acción"
        },
        {
            "id": 12,
            "name": "Aventura"
        },
        {
            "id": 16,
            "name": "Animación"
        },
        {
            "id": 35,
            "name": "Comedia"
        },
        {
            "id": 80,
            "name": "Crimen"
        },
        {
            "id": 99,
            "name": "Documental"
        },
        {
            "id": 18,
            "name": "Drama"
        },
        {
            "id": 10751,
            "name": "Familia"
        },
        {
            "id": 14,
            "name": "Fantasía"
        },
        {
            "id": 36,
            "name": "Historia"
        },
        {
            "id": 27,
            "name": "Terror"
        },
        {
            "id": 10402,
            "name": "Música"
        },
        {
            "id": 9648,
            "name": "Misterio"
        },
        {
            "id": 10749,
            "name": "Romance"
        },
        {
            "id": 878,
            "name": "Ciencia ficción"
        },
        {
            "id": 10770,
            "name": "Película de TV"
        },
        {
            "id": 53,
            "name": "Suspense"
        },
        {
            "id": 10752,
            "name": "Bélica"
        },
        {
            "id": 37,
            "name": "Western"
        }
];