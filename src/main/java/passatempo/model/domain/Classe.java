package passatempo.model.domain;

import javax.persistence.*;

@Entity(name = "Classe")
public class Classe {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_classe;

    @Column(name = "nome", length = 50)
    private String nome;

    @Column(name = "valor")
    private float valor;

    @Column(name = "prazo_devolucao")
    private int prazo_devolucao;

    public Classe() {}

    public Classe(String nome, float valor, int prazo_devolucao) {
        this.nome = nome;
        this.valor = valor;
        this.prazo_devolucao = prazo_devolucao;
    }

    public int getId_classe() {
        return id_classe;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public int getPrazo_devolucao() {
        return prazo_devolucao;
    }

    public void setPrazo_devolucao(int prazo_devolucao) {
        this.prazo_devolucao = prazo_devolucao;
    }
}
