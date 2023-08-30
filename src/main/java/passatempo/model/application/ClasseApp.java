package passatempo.model.application;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import passatempo.model.domain.Classe;
import passatempo.utils.PersistenceUtil;

import javax.persistence.NoResultException;
import javax.persistence.criteria.*;

public class ClasseApp extends GenericApp {
    private Classe pesquisar(String pesq, Integer type) throws HibernateException {
        Session sessao = null;
        Classe classe = null;

        try {
            sessao = PersistenceUtil.getSessionFactory().openSession();
            sessao.beginTransaction();

            CriteriaBuilder builder = sessao.getCriteriaBuilder();
            CriteriaQuery consulta = builder.createQuery(Classe.class);
            Root tabela = consulta.from(Classe.class);

            Expression result = null;
            Predicate restricoes = null;

            result = tabela.get("id_classe");
            restricoes = builder.equal(result, pesq);

            consulta.where(restricoes);
            classe = (Classe) sessao.createQuery(consulta).getSingleResult();

            sessao.getTransaction().commit();
            sessao.close();

        } catch (NoResultException ex) {
            return null;
        } catch (HibernateException ex) {
            if (sessao != null) {
                sessao.getTransaction().rollback();
                sessao.close();
            }
            throw new HibernateException(ex);
        }
        return classe;
    }


    public Classe findById(String id_classe) {
        return pesquisar(id_classe, 1);
    }

}
