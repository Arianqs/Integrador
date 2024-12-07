package Model;

public class Pelicula {
    private int id;
    private String titulo;
    private String sinopsis;
    private String director;
    private String idioma;
    private String genero;
    private String imagen;
    private String duracion;
    private String clasificacion;
	private String es_estreno;
	private String formato;
    // Constructor por defecto	
    public Pelicula() {
        // Puedes inicializar valores predeterminados si lo deseas
    }

    // Constructor completo
    public Pelicula(int id, String titulo, String sinopsis, String director, String idioma, String genero, String imagen) {
        this.id = id;
        this.titulo = titulo;
        this.sinopsis = sinopsis;
        this.director = director;
        this.idioma = idioma;
        this.genero = genero;
        this.imagen = imagen;
    }

    // Constructor alternativo
    public Pelicula(int id, String titulo, String genero, String imagen) {
        this.id = id;
        this.titulo = titulo;
        this.genero = genero;
        this.imagen = imagen;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getSinopsis() {
        return sinopsis;
    }

    public String getDirector() {
        return director;
    }

    public String getIdioma() {
        return idioma;
    }

    public String getGenero() {
        return genero;
    }

    public String getImagen() {
        return imagen;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

	public String getEs_estreno() {
		return es_estreno;
	}

	public void setEs_estreno(String es_estreno) {
		this.es_estreno = es_estreno;
	}

	public void setDuracion(final String string) {
		
		
	}

	public String getClasificacion() {
		return clasificacion;
	}

	public void setClasificacion(String clasificacion) {
		this.clasificacion = clasificacion;
	}

	

	public String getFormato() {
		return formato;
	}

	public void setFormato(String formato) {
		this.formato = formato;
	}

} 
