package passatempo.model.domain;

import javax.persistence.*;


@Entity(name = "Ator")
public class Ator {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_ator;

    @Column(length = 50)
    private String nome;

    public Ator() {}

    public Ator(String nome) {
        this.nome = nome;
    }

    public int getId_ator() {
        return id_ator;
    }

    public void setId_ator(int id_ator) {
        this.id_ator = id_ator;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) { this.nome = nome; }

}
